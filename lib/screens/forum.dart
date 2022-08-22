import 'package:envision/screens/postDisplay.dart';
import 'package:envision/screens/postadd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../sevices/post.dart';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("FORUM")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // ignore: deprecated_member_use
              Text("Welcome User"),
              SizedBox(height: 20,),
              FloatingActionButton(
                onPressed: () {Navigator.pushNamed(context,'/add');},
                child: const Icon(Icons.add),
              ),
              SizedBox(height: 20,),
              StreamProvider.value(value: _postService.getPostByUser(FirebaseAuth.instance.currentUser!.uid), initialData: [],
                child: (PostDisplay()),),
            ],
          ),
        ),
      ),
    );
  }
}