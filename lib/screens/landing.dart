// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:envision/models/sharedPrefModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../wrapper.dart';

class LandingPage extends StatelessWidget {
  final controller = PageController();

  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFD1D1),
        title: Text(
          'Serenity',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        //padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
            Container(
              color: Color(0xFFFFF5E4),
              child: Column(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFFF9494)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(150, 20)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )))),
                      ),
                    ),
                    SizedBox(height: 35),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                      height: 280.0,
                      width: 280.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/amico.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(children: [
                      SizedBox(width: 20),
                      Text(
                        'What is Mental Health?',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: ReadMoreText(
                        'Mental ‘Health’, as the phrase suggests, isn’t just the state of well-being but also the monitoring of the way you experience emotional and behavioural highs and lows, the soundness of your judgments and the amount of stress that your mind undergoes',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.nextPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: Align(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFFF9494)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(150, 20)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )))),
                      ),
                    ),
                  ],
                )
              ]),
            ),
            Container(
              color: Color(0xFFFFF4E5),
              child: Column(children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFFF9494)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(150, 20)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )))),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                      height: 300.0,
                      width: 340.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/rafiki.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(children: [
                      SizedBox(width: 20),
                      Text(
                        'How will this App help you?',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: ReadMoreText(
                        'Serenity can assist you to manage your Mental Health at your fingertips. The user-friendly app allows you to record, observe and jot down your emotions besides helping you connect in your Serene Friend Circle within the app itself',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.nextPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: Align(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFFF9494)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(150, 20)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )))),
                      ),
                    ),
                  ],
                )
              ]),
            ),
            Container(
              color: Color(0xFFFFF4E5),
              child: Column(children: [
                Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                      height: 300.0,
                      width: 340.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/Aaruush Logo.png'),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(children: [
                      SizedBox(width: 20),
                      Text(
                        'About Aaruush',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: ReadMoreText(
                        'The word Aaruush means ‘First rays of the Sun’ is a National-level Techno-Management fest aspires to bring some Sunshine to the darkest and the deepest scopes where technology can lead to innovations. Operated by numerous dedicated students, this fest leaves no arena of tech unvisited',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 15,
                          height: 30,
                        ),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                        //   child: RaisedButton(
                        //       child: Text("Start"),
                        //       onPressed: () async {
                        //         SharedPref sharedPref = SharedPref();
                        //         await sharedPref.setFirstLogin(false);
                        //         final bool? firstLogin = await sharedPref.getFirstLogin();
                        //         print("hello"+firstLogin.toString());
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => Wrapper()),
                        //         );
                        //       }),
                        // ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                          child: ElevatedButton(
                              onPressed: () async {
                                SharedPref sharedPref = SharedPref();
                                await sharedPref.setFirstLogin(false);
                                final bool? firstLogin =
                                    await sharedPref.getFirstLogin();
                                print("hello" + firstLogin.toString());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Wrapper()),
                                );
                              },
                              child: Text(
                                "Start",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(6.0),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFFF9494)),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      const Size(150, 20)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )))),
                        ),
                      ],
                    ),
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
