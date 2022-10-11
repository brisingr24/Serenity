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

  // onTap: (index) => setState(() => _currentIndex = index)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[_currentIndex],
      floatingActionButton: FloatingActionButton(
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
          size: 30,
        ),
        // child: CircularMenu(
        //     startingAngleInRadian: 3.665,
        //     endingAngleInRadian: 5.75,
        //     radius: 70,
        //     toggleButtonColor: Colors.blue,
        //     // toggleButtonIconColor: Colors.transparent,
        //     toggleButtonSize: 40,
        //     toggleButtonPadding: 4,
        //     toggleButtonAnimatedIconData: AnimatedIcons.list_view,
        //     items: [
        //       CircularMenuItem(icon: Icons.clear,color: Colors.red,padding: 4,onTap: () {
        //         setState(() {
        //           log("Working");
        //         });
        //         // callback
        //       }),
        //       CircularMenuItem(icon: Icons.chat_outlined,color: Colors.red,padding: 4,iconSize: 32, onTap: () {
        //         goToChat();
        //         //callback
        //       }),
        //       CircularMenuItem(icon: Icons.report_gmailerrorred_rounded,color: Colors.red,padding: 3, onTap: () {
        //         //callback
        //       }),
        //     ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: Color(0xFFFFD1D1),
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
            print(index);
          });
        },
      ),
    );
  }
}
// body: SpinCircleBottomBarHolder(
//   bottomNavigationBar: SCBottomBarDetails(
//       circleColors: [Colors.white, Colors.orange, Colors.redAccent],
//       iconTheme: IconThemeData(color: Colors.black45),
//       activeIconTheme: IconThemeData(color: Colors.orange),
//       backgroundColor: Colors.white,
//       titleStyle: TextStyle(color: Colors.black45,fontSize: 12),
//       activeTitleStyle: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),
//       actionButtonDetails: SCActionButtonDetails(
//           color: Colors.redAccent,
//           icon: Icon(
//             Icons.expand_less,
//             color: Colors.white,
//           ),
//           elevation: 2),
//       elevation: 2.0,
//       items: [
//         // Suggested count : 4
//         SCBottomBarItem(icon: Icons.home, title: "Home", onPressed: () {(index) => setState(() => _currentIndex = index);print("${_currentIndex}");}),
//         SCBottomBarItem(icon: Icons.forum, title: "Forum", onPressed: () {(index) => setState(() => _currentIndex = index);print("${_currentIndex}");}),
//         SCBottomBarItem(icon: Icons.explore, title: "Explore", onPressed: () {(index) => setState(() => _currentIndex = index);print("${_currentIndex}");}),
//         SCBottomBarItem(icon: Icons.man, title: "Profile", onPressed: () {(index) => setState(() => _currentIndex = index);print("${_currentIndex}");}),
//       ],
//       circleItems: [
//         SCItem(onPressed: () {  }, icon: Icon(Icons.clear,color: Colors.red,size: 30,)),
//         SCItem(onPressed: () {  }, icon: Icon(Icons.chat_bubble_outline)),
//         SCItem(onPressed: () {  }, icon: Icon(Icons.report_gmailerrorred_rounded)),
//       ],
//       bnbHeight: 80 // Suggested Height 80
//   ),
//   child:   _buildScreens()[_currentIndex],
// ),
