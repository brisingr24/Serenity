// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:envision/sevices/auth.dart';
import 'package:envision/widgets/catergory_item.dart';
import 'package:envision/widgets/mooditem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String uid;
  const Home({Key? key, required this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _ismoodvisible = true;
  bool _isquotevisible = false;
  List<String> navItem = [
    'Self Care',
    'My Journal ',
    'My Therapist',
    'My Books',
    'My Music'
  ];

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text("HOME"),
        actions: <Widget>[
          TextButton.icon(
              label: const Text("Sign Out"),
              icon: Icon(Icons.person),
              onPressed: () async {
                _auth.signOut();
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(),
        color: Colors.blue[50],
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
                        style: TextStyle(fontSize: 20),
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
                        onPressed: null,
                        child: const Text(
                          "Panic",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(80, 40)),
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
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ],
                    ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Text(
                        'GOOD MORNING!!!',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'How are you feeling today?',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Mood',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Visibility(
                      visible: _ismoodvisible,
                      child: Container(
                          padding: EdgeInsets.all(8),
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                  onTap: (() {
                                    setState(() {
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
                        height: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child:
                                Image.asset("images/thought_placeholder.png")),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'My 3 AM Friend',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                                style: TextStyle(fontSize: 20),
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
