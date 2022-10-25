// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:envision/sevices/auth.dart';
import 'package:envision/widgets/catergory_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../../models/userModel.dart';
import '../../sevices/user.dart';
import '../signup.dart';

class Explore extends StatefulWidget {
  final String uid;
  const Explore({Key? key, required this.uid}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Explore> {
  List<String> navItem = [
    'Self Care',
    'My Journal ',
    'My Therapist',
    'My Books',
    'My Music'
  ];
  _callNumber() async {
    const number = '+919136711710'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFD1D1),
        title: Text(
          "EXPLORE",
          style: TextStyle(color: Colors.black),
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
      body: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(),
        color: Color(0xFFFFF5E4),
        child: Column(
          children: [
            StreamBuilder<UserModel?>(
              stream: UserService().getUserInfo(widget.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
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
                            style: TextStyle(fontSize: 20),
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
                                  elevation: MaterialStateProperty.all(6.0),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: navItem.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: (() {
                                  log(navItem[index]);
                                }),
                                child: CategoryItem(item: navItem[index]));
                          }),
                    ),
                    Text(
                      'Games',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("images/games.jpg")),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Music',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                              child:
                                  Image.asset("images/musicPlaceholder.jpg")),
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Books',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                              child: Image.asset("images/BoolPlaceHolder.jpg")),
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'More',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                              child:
                                  Image.asset("images/musicPlaceholder.jpg")),
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
