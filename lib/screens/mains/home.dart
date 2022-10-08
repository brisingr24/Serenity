// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:envision/sevices/auth.dart';
import 'package:envision/widgets/catergory_item.dart';
import 'package:envision/widgets/mooditem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Home extends StatefulWidget {
  final String uid;
  const Home({Key? key, required this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String quoteImage = "images/thought_placeholder.png";
  bool _ismoodvisible = true;
  bool _isquotevisible = false;
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
          "HOME",
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
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(),
        color: Color(0xFFFFF5E4),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Image.asset("images/profile_placeholder.jpg"),
                    backgroundColor: Colors.blue,
                    //backgroundImage: NetworkImage(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'USER',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'My Safe Place',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
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
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(90, 40)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discover',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'peralta'),
                        ),
                        Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 85,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Text(
                        'Good Morning!!!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'peralta'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'How are you feeling today?',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Visibility(
                      visible: _ismoodvisible,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                  onTap: (() {
                                    setState(() {
                                      quoteImage = "images/mehmoodquote.jpg";
                                      _ismoodvisible = false;
                                      _isquotevisible = true;
                                    });
                                  }),
                                  child: MoodItem(
                                    image: "images/mood_meh.jpg",
                                    moodtext: "MEH",
                                  )),
                              InkWell(
                                  onTap: (() {
                                    setState(() {
                                      quoteImage = "images/badmoodquote.jpg";
                                      _ismoodvisible = false;
                                      _isquotevisible = true;
                                    });
                                  }),
                                  child: MoodItem(
                                    image: "images/mood_bad.jpg",
                                    moodtext: "BAD",
                                  )),
                              InkWell(
                                  onTap: (() {
                                    setState(() {
                                      quoteImage = "images/happymoodquote.jfif";
                                      _ismoodvisible = false;
                                      _isquotevisible = true;
                                    });
                                  }),
                                  child: MoodItem(
                                    image: "images/mood_good.jpg",
                                    moodtext: "GOOD",
                                  )),
                              InkWell(
                                  onTap: (() {
                                    setState(() {
                                      quoteImage = "images/nicemoodquote.jpg";
                                      _ismoodvisible = false;
                                      _isquotevisible = true;
                                    });
                                  }),
                                  child: MoodItem(
                                    image: "images/mood_nice.jpg",
                                    moodtext: "NICE",
                                  )),
                            ],
                          )),
                    ),
                    Visibility(
                      visible: _isquotevisible,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        width: 500,
                        height: 200,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(quoteImage)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'My 3 AM Friend',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'peralta'),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                              child:
                                  Image.asset("images/profile_placeholder.jpg"),
                              //backgroundImage: NetworkImage(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                'Talk Through Your Anxiety with Dr. Tanvi',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.phone,
                              size: 30,
                            )
                          ]),
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
