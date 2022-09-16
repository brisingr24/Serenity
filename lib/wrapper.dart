// ignore_for_file: prefer_const_constructors

import 'package:envision/models/userModel.dart';
import 'package:envision/screens/mains/forum.dart';
import 'package:envision/screens/mains/home.dart';
import 'package:envision/screens/postadd.dart';
import 'package:envision/screens/signup.dart';
import 'package:envision/screens/verifyscreen.dart';
import 'package:envision/sevices/pageHost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print(user);
    if (user == null) {
      return SignUp();
    }
    else if(user != null ){

    }

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => VerifyScreen(),
        '/add': (context) => postAdd(),
        '/home':(context) => PageHost(),
      },
    );
  }
}
