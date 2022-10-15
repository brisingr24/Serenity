// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:envision/screens/signup.dart';
import 'package:envision/sevices/pageHost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;
  @override
  void initState() {
    user = auth.currentUser;
    user?.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      emailverify();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(
          minutes: 2,
        ), () {
      if (mounted){
        user?.delete();
        print("User deleted");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
            (route) => false);
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFF5E4),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset("images/calm_boy.gif"),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "An Email verification link has been sent to you, Please verify...",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Please check your spam folder in case you don't receive it in inbox",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> emailverify() async {
    user = auth.currentUser;
    print(user?.email);
    await user?.reload();
    if (user!.emailVerified) {
      timer?.cancel();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PageHost()));
    }
  }
}
