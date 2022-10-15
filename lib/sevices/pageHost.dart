// ignore_for_file: prefer_const_constructors
import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:envision/screens/chatbot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

import '../screens/mains/explore.dart';
import '../screens/mains/forum.dart';
import '../screens/mains/home.dart';
import '../screens/mains/profile.dart';

class PageHost extends StatefulWidget {
  @override
  _PageHostState createState() => _PageHostState();
}

class _PageHostState extends State<PageHost> {
  int _currentIndex = 0;
  late PageController _pageController;
  bool a = false;
  final iconList = <IconData>[
    Icons.home,
    Icons.forum,
    Icons.explore,
    Icons.man,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      Home(uid: FirebaseAuth.instance.currentUser!.uid),
      Forum(uid: FirebaseAuth.instance.currentUser!.uid),
      Explore(uid: FirebaseAuth.instance.currentUser!.uid),
      Profile(uid: FirebaseAuth.instance.currentUser!.uid)
    ];
  }

  // onTap: (index) => setState(() => _currentIndex = index)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[_currentIndex],
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.orange,
        backgroundColor: Color(0xFFFFD1D1),
        onPressed: () async {
          try {
            dynamic conversationObject = {
              'appId': '245bd44f458f1551edc13318cb616e21c'
            };
            dynamic result = await KommunicateFlutterPlugin.buildConversation(
                conversationObject);
            print("Conversation builder success : " + result.toString());
          } on Exception catch (e) {
            print("Conversation builder error occurred : " + e.toString());
          }
        },
        child: Icon(
          Icons.chat,
          color: Colors.black,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: Color(0xFFFFD1D1),
        inactiveColor: Colors.black,
        activeColor: Colors.deepPurple,
        activeIndex: _currentIndex,
        splashColor: Colors.orange,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
