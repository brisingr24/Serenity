import 'package:envision/screens/postadd.dart';
import 'package:envision/sevices/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:envision/models/postModel.dart';
import 'package:provider/provider.dart';

class PostDisplay extends StatefulWidget {
  final String uid;
  const PostDisplay({Key? key, required this.uid}) : super(key: key);

  @override
  _PostDisplayState createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  late final Stream<List<PostModel>> postModelStream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PostModel>>(
      stream: PostService().getPostByUser(widget.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          if (snapshot.data!.isNotEmpty) {
            List<PostModel> posts = snapshot.data!;
            return Container(
              height: 400,
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.creator),
                    subtitle: Text(post.text),
                  );
                },
              ),
            );
          }
        }
        return loadingView();
      },
    );
  }

  Widget loadingView() => Center(
    child: CircularProgressIndicator(),
  );
}
