// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:envision/screens/mains/forum.dart';
import 'package:envision/widgets/catergory_item.dart';
import 'package:envision/widgets/postDisplay.dart';
import 'package:envision/sevices/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> navItem = [
    'Self Care',
    'My Journal ',
    'My Therapist',
    'My Books',
    'My Music'
  ];

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
        title: Text("HOME"),
        actions: <Widget>[
          FlatButton.icon(
              label: const Text("Sign Out"),
              icon: Icon(Icons.person),
              onPressed: () async {
                _auth.signOut();
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(),
        color: Colors.pink[50],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.pink,
                    //backgroundImage: NetworkImage(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'USER',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'My Safe Place',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(width: 120,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: null,
                      child: const Text(
                        "Panic",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          fixedSize:
                              MaterialStateProperty.all<Size>(const Size(80, 40)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )))),
                  ),
                  
                ],
              ),
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
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("images/games.jpg")),
                    ),
                     SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Music',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                      Container(
                        
                        child: Image.asset("images/musicPlaceholder.jpg")
                      ),
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                       
                        
                        enableInfiniteScroll: false,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Books',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                      Container(
                        
                        child: Image.asset("images/BoolPlaceHolder.jpg")
                      ),
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                       
                        
                        enableInfiniteScroll: false,
                      ),
                    ),
                     SizedBox(
                      height: 16,
                    ),
                    Text(
                      'More',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                      Container(
                        
                        child: Image.asset("images/musicPlaceholder.jpg")
                      ),
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                       
                        
                        enableInfiniteScroll: false,
                      ),
                    ),
                    
                    
                    
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
