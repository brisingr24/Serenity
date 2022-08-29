// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:envision/screens/mains/forum_screens/forum.dart';
import 'package:envision/screens/mains/forum_screens/postDisplay.dart';
import 'package:envision/sevices/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton.icon(
            label: const Text("Sign Out"),
            icon: Icon(Icons.person),
            onPressed: () async {_auth.signOut();})],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          height: 800,
          width: 400,
          color: Color(0xffeae0d4),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    //backgroundImage: NetworkImage(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'USER',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
