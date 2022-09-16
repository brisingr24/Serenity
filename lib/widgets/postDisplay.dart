// ignore_for_file: prefer_const_constructors, void_checks

import 'package:envision/sevices/post.dart';
import 'package:flutter/material.dart';
import 'package:envision/models/postModel.dart';

class PostDisplay extends StatefulWidget {
  final String uid;
  const PostDisplay({Key? key, required this.uid}) : super(key: key);

  @override
  _PostDisplayState createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  late final Stream<List<PostModel>> postModelStream;
  int giveLike = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget loadingView() => Center(
    child: CircularProgressIndicator(),
  );

   like() {
      giveLike++;
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
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return ListTile(
                        title: Row(children: [Icon(Icons.person),Text(post.creator)],),
                        subtitle: Column(
                          children: [
                            Text(post.text),
                            const SizedBox(height:15),
                            Align(alignment: Alignment.centerLeft,child: Text(post.timestamp!.toDate().toString())),
                            Align(alignment: Alignment.centerLeft,child: IconButton(onPressed: like(), icon: giveLike%2!=0? Icon(Icons.favorite_border,color: Colors.red,size: 30,):Icon(Icons.favorite,color: Colors.red,size: 30,)))
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        }
        return loadingView();
      },
    );
  }
}
