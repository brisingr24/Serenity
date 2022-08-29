// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:envision/screens/bookconfirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Text(
            "My Profile",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 2),
                  spreadRadius: 2, //(x,y)
                  blurRadius: 6,
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          RaisedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  BookingConfirm()),
            );
          },
          child: Text("BOOK"),),
        ],
      ),
    );
  }
}
