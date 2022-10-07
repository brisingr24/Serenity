import 'package:envision/models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    UserModel user = Provider.of<UserModel> (context);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('CREATE POST'),
        actions: [
          ElevatedButton(onPressed: ()async{
            _postService.savePost(text);
            Navigator.pop(context);
          }, child: Text('POST')
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Form(
              child:  TextFormField(
                decoration: InputDecoration(
                  hintText: "Start Writing!",
                  hintMaxLines: 4,
                ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
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