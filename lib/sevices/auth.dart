import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envision/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService extends ChangeNotifier{

  final text =TextEditingController();
  String username ="";

  Future getName() async{
    username = text.text;
    notifyListeners();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(id: user.uid,name: username) : null;
  }

  Stream<UserModel?> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //LOG IN WITH EMAIL AND PASSWORD
  Future signIn(email, pass) async {
    try {
      var user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      ));

      Fluttertoast.showToast(
          msg: "Logged In Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

      _userFromFirebaseUser(user.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong Credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print('The password provided is wrong.');
      }
    } catch (e) {
      print(e);
    }
  }

  //SIGN UP WITH EMAIL AND PASSWORD
  Future signUp(email, pass) async {
    try {
      UserCredential user = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      ));

      Fluttertoast.showToast(
          msg: "Signed In Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user?.uid)
          .set({'name': username, 'email': email});

      _userFromFirebaseUser(user.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "Password too weak",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "Email Already Signed Up!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print('The account already exists for that email.');
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }



  Future signOut() async {
    print("${auth.currentUser}");
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
