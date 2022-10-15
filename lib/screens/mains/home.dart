// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:envision/models/quoteModel.dart';
import 'package:envision/screens/signup.dart';
import 'package:envision/sevices/auth.dart';
import 'package:envision/sevices/qoutesApi.dart';
import 'package:envision/widgets/catergory_item.dart';
import 'package:envision/widgets/mooditem.dart';
import 'package:envision/widgets/moodquote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../../models/userModel.dart';
import '../../sevices/user.dart';

class Home extends StatefulWidget {
  final String uid;
  const Home({Key? key, required this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String quoteImage = "images/thought_placeholder.png";
  String? _category;
  QuotesApi quotesApi = QuotesApi();
  bool _ismoodvisible = true;
  bool _isquotevisible = false;
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
      backgroundColor: Color(0xFFFFF5E4),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFD1D1),
        title: Text(
          "HOME",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<UserModel?>(
                stream: UserService().getUserInfo(widget.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
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
                                onPressed: null,
                                child: const Text(
                                  "Panic",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                style: ButtonStyle(
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
              SizedBox(height: 20,),
              Text(
                'Discover',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'peralta'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: 85,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  'Good Morning!!!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'peralta'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'How are you feeling today?',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Visibility(
                visible: _ismoodvisible,
                child: Container(
                    padding: EdgeInsets.all(5),
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                            onTap: (() {
                              setState(() {
                                _category = "courage";
                                quoteImage = "images/mehmoodquote.jpg";
                                _ismoodvisible = false;
                                _isquotevisible = true;
                              });
                            }),
                            child: MoodItem(
                              image: "images/mood_meh.jpg",
                              moodtext: "MEH",
                            )),
                        InkWell(
                            onTap: (() {
                              setState(() {
                                _category = "failure";
                                quoteImage = "images/badmoodquote.jpg";
                                _ismoodvisible = false;
                                _isquotevisible = true;
                              });
                            }),
                            child: MoodItem(
                              image: "images/mood_bad.jpg",
                              moodtext: "BAD",
                            )),
                        InkWell(
                            onTap: (() {
                              setState(() {
                                _category = "happiness";
                                quoteImage = "images/happymoodquote.jfif";
                                _ismoodvisible = false;
                                _isquotevisible = true;
                              });
                            }),
                            child: MoodItem(
                              image: "images/mood_good.jpg",
                              moodtext: "GOOD",
                            )),
                        InkWell(
                            onTap: (() {
                              setState(() {
                                _category = "inspirational";
                                quoteImage = "images/nicemoodquote.jpg";
                                _ismoodvisible = false;
                                _isquotevisible = true;
                              });
                            }),
                            child: MoodItem(
                              image: "images/mood_nice.jpg",
                              moodtext: "NICE",
                            )),
                      ],
                    )),
              ),

              Visibility(
                visible: _isquotevisible,
                child: FutureBuilder(
                  future: quotesApi.getdata(_category),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return const AlertDialog(
                        title: Text("Failed to load Data"),
                      );
                    }
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If we got an error
                      if (snapshot.hasError) {
                        return Center(
                            child: AlertDialog(
                          title: Text('${snapshot.error}'),
                        )
                            );
                      } else if (snapshot.hasData) {
                        QuoteModel? quoteModel =
                            snapshot.data as QuoteModel?;
                        // log(_category.toString()+" "+quoteModel!.category.toString());
                        return MoodQuote(
                          quote: quoteModel?.quote,
                          author: quoteModel?.author,
                        );
                      }
                    }
                    return const Center(
                        child: AlertDialog(
                      alignment: Alignment.center,
                      title: Text(
                        "Failed to load Data",
                        textAlign: TextAlign.center,
                      ),
                    ));
                  }),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'My 3 AM Friend',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'peralta'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "images/userdef.png",
                          height: 50,
                          width: 50,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Talk Through Your Anxiety with Dr. Tanvi',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: _callNumber,
                        icon: Icon(Icons.phone),
                        iconSize: 30,
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
