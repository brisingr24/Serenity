// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String profname = "Param";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFDF3FF),
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Center(child: Text("About Us")),
        // ),
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
                        fontSize: 23,
                        fontFamily: 'secular',
                        letterSpacing: 0.3),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 1,
                    width: size.width / 4.7,
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
                    color: Colors.black,
                    wordSpacing: 0.45,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'raleway'),
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
                  child: Text(
                    "Read More",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFFF9494)),
                  ),
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
                  Text(
                    'About Aaruush',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'secular',
                        fontSize: 23,
                        letterSpacing: 0.3),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 1,
                    width: size.width / 2.45,
                    color: Colors.black,
                  ),
                ],
              )
            ]),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                'It runs 11,000 trains every day on tracks that spread over 60,000 km in length.'
                'It employs close to 1.54 million people, making it the seventh-largest employer in the world, according to Forbes.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    wordSpacing: 0.45,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'raleway'),
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
                  child: Text(
                    "Read More",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFFF9494),
                  )),
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
                        fontFamily: 'secular',
                        fontSize: 23,
                        letterSpacing: 0.3),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 1,
                    width: size.width / 4.7,
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0.45,
                    fontSize: 17,
                    fontFamily: 'raleway'),
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
                  child: Text(
                    "Read More",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFFF9494))),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset("images/env2.png"),
            Text(
              "Made with love by Team Envision ❤",
              style: TextStyle(fontSize: 14, fontFamily: 'silkscreen'),
            ),
            SizedBox(
              height: 30,
            ),
          ]),
        )),
      ),
    );
  }
}
