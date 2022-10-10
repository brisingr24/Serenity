import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
class CircularMen extends StatefulWidget {
  const CircularMen({ Key? key }) : super(key: key);

  @override
  State<CircularMen> createState() => _CircularMenState();
}

class _CircularMenState extends State<CircularMen> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.blue,
        onPressed: ()  {

        },
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
                setState(() {
                  log("Working");
                });
                // callback
              }),
              CircularMenuItem(icon: Icons.chat_outlined,color: Colors.red,padding: 4,iconSize: 32, onTap: () {
               
                //callback
              }),
              CircularMenuItem(icon: Icons.report_gmailerrorred_rounded,color: Colors.red,padding: 3, onTap: () {
                setState(() {
                  log("Working");
                });
                //callback
              }),
            ]),
      );
  }
}