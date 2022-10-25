// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:envision/screens/bookings/appointment.dart';
import 'package:envision/screens/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/userModel.dart';
import '../../sevices/user.dart';
import '../../widgets/JournCard.dart';
import '../aboutus.dart';
import '../../myJournal/journal.dart';
import '../questionnaire.dart';

class Profile extends StatefulWidget {
  final String uid;
  const Profile({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final Stream<UserModel?> userModelStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 70),
              Text(
                "My Profile",
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
              SizedBox(height: 20),
              Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Color(0xFFFFF5E4),
                    height: 80,
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 180),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 150,
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF5E4),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: StreamBuilder<UserModel?>(
                    stream: UserService().getUserInfo(widget.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          UserModel user = snapshot.data!;
                          return Column(
                            children: [
                              user.profileImgURL == null
                                  ? CircleAvatar(
                                      child: Image.asset(
                                        "images/userdef.png",
                                      ),
                                      radius: 60,
                                      backgroundColor: Colors.white,
                                    )
                                  : CircleAvatar(
                                      radius: 80,
                                      backgroundImage: NetworkImage(
                                        user.profileImgURL ?? ' ',
                                      ),
                                    ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${user.name}',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  user.age != null
                                      ? Text(
                                          '${user.age} years |',
                                          style: TextStyle(fontSize: 18),
                                        )
                                      : SizedBox(
                                          width: 1,
                                        ),
                                  user.gender != null
                                      ? Text(
                                          '${user.gender}',
                                          style: TextStyle(fontSize: 18),
                                        )
                                      : SizedBox(
                                          width: 1,
                                        ),
                                ],
                              ),
                              user.city != null
                                  ? Text(
                                      '${user.city}',
                                      style: TextStyle(fontSize: 18),
                                    )
                                  : SizedBox(
                                      height: 1,
                                    ),
                            ],
                          );
                        }
                      }
                      return loadingView();
                    },
                  ),
                ),
              ]),
              Container(
                width: 350,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF5E4),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0), bottom: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 55,
                          ),
                          Text(
                            "EDIT DETAILS",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile()),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Appointments",
                          style: TextStyle(fontSize: 20),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    StreamBuilder<UserModel?>(
                        stream: UserService().getUserInfo(widget.uid),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                                child: Text("Book Your First Appointment!"));
                          }
                          var data = snapshot.data;
                          if (data == null) {
                            return Center(child: Text("No data"));
                          }

                          if (data.booked == true) {
                            return StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("doctor")
                                  .doc(data.docID)
                                  .snapshots(),
                              builder: (context,snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                }
                                if (snapshot.hasData) {
                                  var data2 = snapshot.data;
                                  return Container(
                                      color: Colors.black,
                                      height: 120,
                                      width: 300,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 2,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                color: Colors.white,
                                                height: 100,
                                                width: 150,
                                                child: Center(child: Text(data2.toString()),),
                                              ),
                                            );
                                          }));
                                }
                                return Text(
                                  "There's No Notes",
                                  style: TextStyle(fontSize: 15, color: Colors.black54),
                                );
                              },
                            );
                          } else {
                            return Center(
                                child: Text("Book Your First Appointment!"));
                          }
                        }),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Appointment(uid: widget.uid)));
                        },
                        child: Text("BOOK"),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(6.0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFFF9494)))),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Journal",
                          style: TextStyle(fontSize: 20),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: Text(
                            "Whats on your mind today?",
                            style: TextStyle(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Journal(widget.uid)),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Question()));
                        },
                        child: const Text(
                          "TAKE A SURVEY!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(6.0),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFFF9494)),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(500, 20)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )))),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()));
                        },
                        child: const Text(
                          "ABOUT US",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(6.0),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFFF9494)),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(500, 20)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )))),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadingView() => Center(
        child: CircularProgressIndicator(),
      );
}
