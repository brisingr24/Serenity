// ignore_for_file: prefer_const_constructors

import 'package:envision/widgets/postDisplay.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("FORUM")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // ignore: deprecated_member_use
              Text("Welcome User"),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },
                child: const Icon(Icons.add),
              ),
              SizedBox(
                height: 20,
              ),
              PostDisplay(uid: FirebaseAuth.instance.currentUser!.uid),
            ],
          ),
        ),
      ),
    );
  }
}
