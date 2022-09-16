// ignore_for_file: prefer_const_constructors
import 'package:envision/screens/landing.dart';
import 'package:envision/screens/mains/explore.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState(){
    super.initState();
    _jumpHome();
  }

  _jumpHome() async{
    await Future.delayed(const Duration(seconds: 3),(){});

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  LandingPage()),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      color:  Color(0xffeae0d4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            color: Colors.black,
          ),
          const SizedBox(height:30),
          DefaultTextStyle(style: TextStyle(fontSize: 25,color: Colors.green), child: const Text("MINDFULNESS")),
        ],
      ),
    );
  }
}