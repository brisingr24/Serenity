// ignore_for_file: prefer_const_constructors

import 'package:envision/screens/mains/home.dart';
import 'package:envision/screens/mains/profile.dart';
import 'package:flutter/material.dart';


class BookingConfirm extends StatelessWidget {
  const BookingConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Container(
            width: 350,
            height: 465,
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(10.0,25,0,10),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image:  DecorationImage(image: ExactAssetImage(
                                        'images/saibo.gif'
                                    ),
                                        fit: BoxFit.fitHeight),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Container(
                                  child: Text('Hey Student', style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 25,

                                  ),),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  child: Text('Your Booking has been confirmed!', style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Center(child: Text("BACK TO",style: TextStyle(color: Colors.black,fontSize: 24),)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: RaisedButton(
                        elevation: 0,
                        textColor: Colors.black,
                        color: Colors.white54,
                        highlightColor: Colors.blueAccent,
                        child: Text("Home"),
                        onPressed: () {
                          Navigator.pushNamed(context, '/pagehost');
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.purpleAccent,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        elevation: 0,
                        textColor: Colors.black,
                        color: Colors.white54,
                        highlightColor: Colors.blueAccent,
                        child: Text("My Bookings"),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.purpleAccent,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    )],
                ),
              ],
            ),

          ),
        )
    );
  }
}

