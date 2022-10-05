// ignore_for_file: prefer_const_constructors, void_checks
import 'package:envision/models/postModel.dart';
import 'package:envision/sevices/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 25,
                      );
                    },
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
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder<UserModel?>(
                                      stream: UserService()
                                          .getUserInfo(post.creator),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          print(snapshot.data);
                                          if (snapshot.data != null) {
                                            UserModel user = snapshot.data!;
                                            return Row(
                                              children: [
                                                user.profileImgURL == null
                                                    ? Image.asset(
                                                        "images/userdef.png",
                                                        height: 40,
                                                        width: 30,
                                                      )
                                                    : Image.network(
                                                        user.profileImgURL ??
                                                            ' ',
                                                        height: 40,
                                                        width: 30,
                                                        fit: BoxFit.cover,
                                                      ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Text(
                                                    '${user.name}',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        }
                                        return Center();
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(post.text),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
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
                                        Spacer(),
                                        Text(
                                            "${DateFormat('yyyy-MM-dd – kk:mm').format(post.timestamp!.toDate())}"),
                                      ],
                                    ),
                                  ],
                                ),
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
