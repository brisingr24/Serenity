// ignore_for_file: prefer_const_constructors, void_checks

import 'package:envision/models/postModel.dart';
import 'package:envision/sevices/post.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userModel.dart';
import '../sevices/user.dart';

class PostDisplay extends StatefulWidget {
  final String uid;
  const PostDisplay({Key? key, required this.uid}) : super(key: key);

  @override
  _PostDisplayState createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  late final Stream<List<PostModel>> postModelStream;
  PostService _postService = PostService();
  late final Stream<UserModel?> userModelStream;
  int giveLike = 0;
  @override
  void initState() {
    // TODO: implement initState
    postModelStream = _postService.getPostByUser(widget.uid);
    super.initState();
  }

  Widget loadingView() => Center(
        child: CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PostModel>>(
      stream: postModelStream,
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

                      return StreamBuilder<bool>(
                          stream:
                              _postService.getCurrentUserLike(post, widget.uid),
                          builder: (context, snapshotLike) {
                            if (!snapshotLike.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListTile(
                              title: Row(
                                children: [
                                  Icon(Icons.person),
                                  Text(post.creator),
                                  StreamBuilder<UserModel?>(
                                    stream: UserService().getUserInfo(widget.uid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        print(snapshot.data);
                                        if (snapshot.data != null) {
                                          UserModel user = snapshot.data!;
                                          return Column(
                                            children: [
                                              Text('${user.name}'),
                                            ],
                                          );
                                        }
                                      }
                                      return loadingView();
                                    },
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  Text(post.text),
                                  const SizedBox(height: 15),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          post.timestamp!.toDate().toString())),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      onPressed: () {
                                        _postService.likePost(
                                            post,
                                            snapshotLike.data ?? false,
                                            widget.uid);
                                      },
                                      icon: snapshotLike.data == false
                                          ? Icon(
                                              Icons.favorite_border,
                                              color: Colors.red,
                                              size: 30,
                                            )
                                          : Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
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
