// ignore_for_file: prefer_const_constructors
import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:envision/screens/chatbot.dart';
import 'package:envision/widgets/circularmenu.dart';
import 'package:flutter/material.dart';
import '../screens/mains/explore.dart';
import '../screens/mains/forum.dart';
import '../screens/mains/home.dart';
import '../screens/mains/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

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

  goToChat() {
    print("TAP");
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBot()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // floatingActionButton: CircularMen(),
       CircularMenu(
        backgroundWidget: _buildScreens()[_currentIndex],
          startingAngleInRadian: 3.665,
          endingAngleInRadian: 5.75,
          radius: 70,
          toggleButtonColor: Colors.blue,
          // toggleButtonIconColor: Colors.transparent,
          toggleButtonSize: 30,
          toggleButtonPadding: 1,
          toggleButtonAnimatedIconData: AnimatedIcons.list_view,
          items: [
            CircularMenuItem(icon: Icons.clear,color: Colors.red,padding: 4,onTap: () {
              setState(() {
                log("Working");
              });
              // callback
            }),
            CircularMenuItem(icon: Icons.chat_outlined,color: Colors.red,padding: 4,iconSize: 32, onTap: () {
              goToChat();
              //callback
            }),
            CircularMenuItem(icon: Icons.report_gmailerrorred_rounded,color: Colors.red,padding: 3, onTap: () {
              setState(() {
                log("Working");
              });
              //callback
            }),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: Colors.blue,
        activeIndex: _currentIndex,
        splashColor: Colors.orange,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _currentIndex = index), //other params
      ),
    );
  }
}
