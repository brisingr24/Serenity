// ignore_for_file: prefer_const_constructors

import 'package:envision/widgets/postDisplay.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../models/userModel.dart';
import '../../sevices/user.dart';
import '../postadd.dart';

class Forum extends StatefulWidget {
  final String uid;
  const Forum({Key? key, required this.uid}) : super(key: key);
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("FORUM")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: deprecated_member_use
              StreamBuilder<UserModel?>(
                stream: UserService().getUserInfo(widget.uid),
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
                                  user.profileImgURL ?? ' ',
                                  height: 80,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text('${user.name}'),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                                onPressed: null,
                                child: const Text(
                                  "Panic",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        const Size(80, 16)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )))),
                          ),
                        ],
                      );
                    }
                  }
                  return Center();
                },
              ),
              SizedBox(height: 20,),
              Text(
                "Share Your Story !",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => postAdd()),
                          );
                        },
                        child: Text(
                          "Add a new post",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(6.0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade50),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(150, 20)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Top Stories",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                  child:
                      PostDisplay(uid: FirebaseAuth.instance.currentUser!.uid)),
            ],
          ),
        ),
      ),
    );
  }
}
