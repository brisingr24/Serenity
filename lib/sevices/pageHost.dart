// ignore_for_file: prefer_const_constructors
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import '../screens/mains/explore.dart';
import '../screens/mains/forum.dart';
import '../screens/mains/home.dart';
import '../screens/mains/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class PageHost extends StatefulWidget {
  @override
  _PageHostState createState() => _PageHostState();

}

class _PageHostState extends State<PageHost> {
  int _currentIndex = 0;
  late PageController _pageController;
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
    return [Home(), Forum(), Explore(),Profile(uid: FirebaseAuth.instance.currentUser!.uid)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: CircularMenu(
            startingAngleInRadian: 3.665,
            endingAngleInRadian: 5.75,
            radius: 70,
            toggleButtonColor: Colors.transparent,
            // toggleButtonIconColor: Colors.transparent,
            toggleButtonSize: 30,
            toggleButtonPadding: 1,
            toggleButtonAnimatedIconData: AnimatedIcons.list_view,
            items: [
              CircularMenuItem(icon: Icons.clear,color: Colors.red,padding: 4,onTap: () {
                // callback
              }),
              CircularMenuItem(icon: Icons.chat_outlined,color: Colors.red,padding: 5,iconSize: 25, onTap: () {
                //callback
              }),
              CircularMenuItem(icon: Icons.report_gmailerrorred_rounded,color: Colors.red,padding: 3, onTap: () {
                //callback
              }),
            ]),
        //params
      ),
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

