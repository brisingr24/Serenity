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
  int ct=0;

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
            return Column(
              children: [
                SizedBox(
                  height: 400,
                  child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
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
                              _postService.getCurrentUserLike(post),
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
                                  border: Border.all(color: Colors.black)),
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
                                                    ? CircleAvatar(
                                                        child: Image.asset(
                                                          "images/userdef.png",
                                                          height: 50,
                                                          width: 50,
                                                        ),
                                                        backgroundColor:
                                                            Colors.white,
                                                      )
                                                    : CircleAvatar(
                                                        radius: 25,
                                                        backgroundImage:
                                                            NetworkImage(
                                                          user.profileImgURL ??
                                                              ' ',
                                                        ),
                                                      ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    '${user.name}',
                                                    style:
                                                        TextStyle(fontSize: 18),
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
                                          onPressed: () async{
                                            _postService.likePost(
                                                post,
                                                snapshotLike.data ?? false);
                                            // ct = await PostService().getCountLike(post);
                                            // print("Counts : " + ct.toString());
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
                                        //Text("${ct}"),
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
                ),
              ],
            );
          }
        }
        return loadingView();
      },
    );
  }
}
