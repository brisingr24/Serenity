// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:envision/models/userModel.dart';
import 'package:envision/screens/postadd.dart';
import 'package:envision/screens/signup.dart';
import 'package:envision/screens/verifyscreen.dart';
import 'package:envision/sevices/pageHost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    UserModel? user = Provider.of<UserModel?>(context);

    if (user == null) {
      return SignUp();
    }
    else {
      print(auth.currentUser?.emailVerified);
      if(auth.currentUser?.emailVerified == false) {
        return VerifyScreen();
      }
      else {
        return PageHost();
      }
    }

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => VerifyScreen(),
        '/add': (context) => postAdd(),
        '/home': (context) => PageHost(),
      },
    );
  }
}
