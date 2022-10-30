// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


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
                    width: size.width / 5.1,
                    color: Colors.black,
                  )
                ],
              )
            ]),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ReadMoreText(
                'SRM University is a place of unbridled happiness and wonderful learning. It proves that learning and growth are occurring all at once. SRM provides an excellent academic training blended with co-curricular activities. ',
                style: TextStyle(
                    color: Colors.black45,
                    wordSpacing: 0.25,
                    fontSize: 18),
                trimLines: 2,
                textAlign: TextAlign.left,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Show More',
                trimExpandedText: 'Show Less',
                moreStyle: (TextStyle(
                  color: Colors.blue,
                )),
                lessStyle: (TextStyle(
                  color: Colors.blue,
                )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              width: size.width,
              height: size.height / 4,
              child: Image.asset(
                "images/A22_header.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
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
              child: ReadMoreText(
                'Aaruush is the student-run, official Annual Techno-Management Fest of SRM Institute of Science and Technology, Chennai. Aaruush comprises 14 domains and 14 committees, which provide a platform to showcase and innovate a multitude of ideas which range from Architecture to Medical Sciences. The cohesive structure which connects the Domains is the 14 committees of Aaruush alongside Team Envision and Team Outreach. Aaruush organizes several workshops, expos, conferences, luminary hours and non-profit initiatives to facilitate the general progress of human society with a footfall of 72,000+ and online following of 60,000+.',
                style: TextStyle(
                    color: Colors.black45,
                    wordSpacing: 0.25,
                    fontSize: 18),
                trimLines: 2,
                textAlign: TextAlign.left,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Show More',
                trimExpandedText: 'Show Less',
                moreStyle: (TextStyle(
                  color: Colors.blue,
                )),
                lessStyle: (TextStyle(
                  color: Colors.blue,
                )),
              ),
            ),
            SizedBox(
              height: 15,
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
              child: ReadMoreText(
                "Team Envision, the multidisciplinary technical team of Aaruush, was formed with the goal of finding solutions to the majority of societal and campus-related problems. It is a consortium of AI-ML, Cyber Security, Blockchain, Editorial, Game Developers, Web Developers, App Developers and Designers who work closely to ideate, fabricate and develop products that tackle the above-mentioned problems. Team Envision promotes learning and growth through effective solutions.",
                style: TextStyle(
                    color: Colors.black45,
                    wordSpacing: 0.25,
                    fontSize: 18),
                trimLines: 2,
                textAlign: TextAlign.left,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Show More',
                trimExpandedText: 'Show Less',
                moreStyle: (TextStyle(
                  color: Colors.blue,
                )),
                lessStyle: (TextStyle(
                  color: Colors.blue,
                )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset("images/env2.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Made with love by Team Envision ❤",
                style: TextStyle(fontSize: 18, fontFamily: 'silkscreen'),
              ),
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
