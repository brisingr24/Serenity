import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:envision/models/postModel.dart';
import 'package:provider/provider.dart';

class PostDisplay extends StatefulWidget {
  const PostDisplay({Key? key}) : super(key: key);

  @override
  _PostDisplayState createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<PostModel>>(context);

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context,index){
        final post = posts[index];
        return ListTile(
          title: Text(post.creator),
          subtitle: Text(post.text),
        );
      },
    );
  }
}