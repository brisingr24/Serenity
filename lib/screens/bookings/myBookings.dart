// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/userModel.dart';
import '../../sevices/user.dart';

class MyBookings extends StatefulWidget {
  final String uid;
  const MyBookings({Key? key, required this.uid}) : super(key: key);

  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                          .collection("users")
                          .doc(widget.uid)
                          .collection("bookedDocs")
                          .doc()
                          .snapshots(),
                      builder: (context,snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          var data2 = snapshot.data;
                          print(data2?.reference.id);
                          return Container(
                              color: Colors.black,
                              height: 120,
                              width: 300,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 2,

                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Colors.white,
                                        height: 100,
                                        width: 150,
                                        child: Column(
                                          children: [
                                            // Text(data2!["name"].toString()),
                                            // Text(data2["job"].toString()),
                                            // Text(data2["city"].toString())
                                          ],
                                        ),
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
          ],
        ),
      ),
    );
  }
}
