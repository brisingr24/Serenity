// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String profname = "Param";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("About Us")),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: size.width,
            height: size.height / 4,
            child: Image.asset(
              "images/srm.jfif",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Row(children: [
            SizedBox(width: 20),
            Row(
              children: [
                Text(
                  'About SRM University',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      letterSpacing: 0.3),
                ),
                SizedBox(width: 10),
                Container(
                  height: 1,
                  width: 100,
                  color: Colors.black,
                )
              ],
            )
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(
              'It runs 11,000 trains every day on tracks that spread over 60,000 km in length. It employs close to 1.54 million people, making it the seventh-largest employer in the world, according to Forbes.',
              style: TextStyle(
                  color: Colors.black, wordSpacing: 0.45, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                child: Text("Read More"),
                onPressed: null,
              ),
            ],
          ),
          //about envision
          SizedBox(
            height: 0,
          ),
          Container(
            width: size.width,
            height: size.height / 4,
            child: Image.asset(
              "images/env1.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Row(children: [
            SizedBox(width: 20),
            Row(
              children: [
                Container(
                  height: 1,
                  width: 180,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  'About Aaruush',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      letterSpacing: 0.3),
                ),
              ],
            )
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(
              'It runs 11,000 trains every day on tracks that spread over 60,000 km in length.'
              'It employs close to 1.54 million people, making it the seventh-largest employer in the world, according to Forbes.',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black, wordSpacing: 0.45, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                child: Text("Read More"),
                onPressed: null,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: size.width,
            height: size.height / 4,
            child: Image.asset(
              "images/env3.jpeg",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Row(children: [
            SizedBox(width: 20),
            Row(
              children: [
                Text(
                  'About Team Envision',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      letterSpacing: 0.3),
                ),
                SizedBox(width: 10),
                Container(
                  height: 1,
                  width: 120,
                  color: Colors.black,
                ),
              ],
            )
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(
              'It runs 11,000 trains every day on tracks that spread over 60,000 km in length.'
              ' It employs close to 1.54 million people, making it the seventh-largest employer in the world, according to Forbes.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black, wordSpacing: 0.45, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                child: Text("Read More"),
                onPressed: null,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset("images/env2.png"),
          Text(
            "Made with love by Team Envision ❤",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      )),
    );
  }
}
