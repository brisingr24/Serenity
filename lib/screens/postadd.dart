import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sevices/post.dart';

class postAdd extends StatefulWidget {
  const postAdd({Key? key}) : super(key: key);

  @override
  _postAddState createState() => _postAddState();
}

class _postAddState extends State<postAdd> {
  final PostService _postService = PostService();
  String text ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create post'),
        actions: [
          FlatButton(textColor:Colors.white,onPressed: ()async{
            _postService.savePost(text);
            Navigator.pop(context);
          }, child: Text('Post')
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Form(
              child:  TextFormField(
                onChanged: (val){
                  setState(() {
                    text = val;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}