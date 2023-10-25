// ignore_for_file: prefer_const_constructors
import 'package:envision/sevices/auth.dart';
import 'package:envision/widgets/postDisplay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../../models/userModel.dart';
import '../../sevices/user.dart';
import '../postadd.dart';
import '../signup.dart';

class Forum extends StatefulWidget {
  final String uid;
  const Forum({Key? key, required this.uid}) : super(key: key);
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  final AuthService _auth = AuthService();

  _callNumber() async {
    const number = '+91913671171'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E4),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFD1D1),
        title: Text(
          "Forum",
          style: TextStyle(
              color: Colors.black, fontFamily: 'Pacifico', fontSize: 25),
        ),
        actions: <Widget>[
          TextButton.icon(
              label: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () async {
                _auth.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              })
        ],
      ),
      body: Padding(
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
                            ? CircleAvatar(
                                child: Image.asset(
                                  "images/userdef.png",
                                  height: 50,
                                  width: 50,
                                ),
                                backgroundColor: Colors.white,
                              )
                            : CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  user.profileImgURL ?? ' ',
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            '${user.name}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              onPressed: _callNumber,
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
            SizedBox(
              height: 20,
            ),
            Text(
              "Share Your Story !",
              style: TextStyle(fontSize: 25, fontFamily: "Lobster"),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => postAdd()));
                      },
                      child: Text(
                        "Add a new post",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.5,
                            fontFamily: "Peralta"),
                      ),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(6.0),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFFF9494)),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(150, 20)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
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
              style: TextStyle(fontSize: 25, fontFamily: "Lobster"),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                  child:
                      PostDisplay(uid: FirebaseAuth.instance.currentUser!.uid)),
            ),
          ],
        ),
      ),
    );
  }
}
