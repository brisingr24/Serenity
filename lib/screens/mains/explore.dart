// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:envision/sevices/auth.dart';
import 'package:envision/widgets/catergory_item.dart';
import 'package:envision/widgets/music.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../../models/userModel.dart';
import '../../sevices/user.dart';
import '../signup.dart';
import 'package:url_launcher/url_launcher.dart';

class Explore extends StatefulWidget {
  final String uid;
  const Explore({Key? key, required this.uid}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Explore> {
  List<String> navItem = [
    'Self Care',
    'My Journal ',
    'My Therapist',
    'My Books',
    'My Music'
  ];
  _callNumber() async {
    const number = '+919136711710'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFD1D1),
        title: Text(
          "EXPLORE",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton.icon(
              label: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () async {
                _auth.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(),
        color: Color(0xFFFFF5E4),
        child: Column(
          children: [
            StreamBuilder<UserModel?>(
              stream: UserService().getUserInfo(widget.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    UserModel user = snapshot.data!;
                    return Row(
                      children: [
                        user.profileImgURL == null
                            ? CircleAvatar(
                          child: Image.asset(
                            "images/userdef.png",
                            height: 50,
                            width: 50,
                          ),
                          backgroundColor: Colors.white,
                        )
                            : CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            user.profileImgURL ?? ' ',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            '${user.name}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              onPressed: _callNumber,
                              child: const Text(
                                "Panic",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(6.0),
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      const Size(80, 16)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                      )))),
                        ),
                      ],
                    );
                  }
                }
                return Center();
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: navItem.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: (() {
                                  log(navItem[index]);
                                }),
                                child: CategoryItem(item: navItem[index]));
                          }),
                    ),
                    Text(
                      'Games',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            child: Image.asset("images/games.jpg"),
                            onTap: () => launch(
                                "https://play.google.com/store/search?q=alto%27s+odyssey&c=apps"),
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Music',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    // CarouselSlider.builder(
                    //   itemCount: 5,
                    //   itemBuilder: (BuildContext context, int itemIndex,
                    //           int pageViewIndex) =>
                    //       Container(
                    //           child:
                    //               Image.asset("images/musicPlaceholder.jpg")),
                    //   options: CarouselOptions(
                    //     height: 180,
                    //     autoPlay: true,
                    //     enableInfiniteScroll: false,
                    //   ),
                    // ),
                    // Container(
                    //   height: 50,
                    //   width: 50,
                    //   color: Colors.pink,
                    //   child: Center(
                    //     child: InkWell(
                    //         child: Text("Hello World"),
                    //         onTap: () => launch(
                    //             "https://www.youtube.com/watch?v=nf4_Ke5B1K8")),
                    //   ),
                    // ),
                    SingleChildScrollView(
                      padding: EdgeInsets.all(8.0),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          music_container(
                              image: "images/musicPlaceholder.jpg",
                              url:
                                  "https://open.spotify.com/playlist/0ffnLxCftwLzmXDO7DJEXc?si=BpKndlCtSnWcZ__V_GiSKw&utm_source=whats"),
                          music_container(
                              image: "images/musicPlaceholder.jpg",
                              url:
                                  "https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget"),
                          music_container(
                              image: "images/musicPlaceholder.jpg",
                              url:
                                  "https://api.flutter.dev/flutter/widgets/ListView-class.html"),
                          music_container(
                              image: "images/musicPlaceholder.jpg",
                              url:
                                  "https://stackoverflow.com/questions/43149055/how-do-i-open-a-web-browser-url-from-my-flutter-code"),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Books',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    // CarouselSlider.builder(
                    //   itemCount: 5,
                    //   itemBuilder: (BuildContext context, int itemIndex,
                    //           int pageViewIndex) =>
                    //       Container(
                    //           child: Image.asset("images/BoolPlaceHolder.jpg")),
                    //   options: CarouselOptions(
                    //     height: 200,
                    //     autoPlay: true,
                    //     enableInfiniteScroll: false,
                    //   ),
                    // ),
                    SingleChildScrollView(
                      padding: EdgeInsets.all(6.0),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          books_container(
                              image: "images/book1.jpg",
                              url: "https://amzn.eu/d/4KW8r0k"),
                          SizedBox(
                            width: 10,
                          ),
                          books_container(
                              image: "images/book2.jpg",
                              url: "https://amzn.eu/d/4KW8r0k"),
                          SizedBox(
                            width: 10,
                          ),
                          books_container(
                              image: "images/book3.jpg",
                              url: "https://amzn.eu/d/2BZbg2b"),
                          SizedBox(
                            width: 10,
                          ),
                          books_container(
                              image: "images/book4.jpg",
                              url: "https://amzn.eu/d/2BZbg2b"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'More',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    // CarouselSlider.builder(
                    //   itemCount: 5,
                    //   itemBuilder: (BuildContext context, int itemIndex,
                    //           int pageViewIndex) =>
                    //       Container(
                    //           child:
                    //               Image.asset("images/musicPlaceholder.jpg")),
                    //   options: CarouselOptions(
                    //     height: 180,
                    //     autoPlay: true,
                    //     enableInfiniteScroll: false,
                    //   ),
                    // ),
                    SingleChildScrollView(
                      padding: EdgeInsets.all(6.0),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          more_container(
                              image: "https://youtu.be/PReWdfg2cM8",
                              url: "https://youtu.be/PReWdfg2cM8"),
                          more_container(
                              image:
                                  "https://img.youtube.com/vi/H8xMIjz6LRY/0.jpg",
                              url: "https://youtu.be/H8xMIjz6LRY"),
                          more_container(
                              image:
                                  "https://img.youtube.com/vi/Bzh9HmjqwLg/0.jpg",
                              url: "https://youtu.be/Bzh9HmjqwLg"),
                          more_container(
                              image:
                                  "https://img.youtube.com/vi/bwP2qIC8sc4/0.jpg",
                              url: "https://youtu.be/bwP2qIC8sc4")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
