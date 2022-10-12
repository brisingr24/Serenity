import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envision/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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


  Future signIn(email, pass) async {
    try {
      var user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      ));

      _userFromFirebaseUser(user.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signUp(email, pass) async {
    try {
      UserCredential user = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      ));

      print("MY name is ${username} , ${email}");

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user?.uid)
          .set({'name': username, 'email': email});

      _userFromFirebaseUser(user.user);
    } on FirebaseAuthException catch (e) {
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
