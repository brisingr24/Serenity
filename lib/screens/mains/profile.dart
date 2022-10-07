// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:envision/screens/bookings/appointment.dart';
import 'package:envision/screens/editprofile.dart';
import 'package:flutter/material.dart';
import '../../models/userModel.dart';
import '../../widgets/ContactTile.dart';
import '../questionnaire.dart';
import '../../sevices/user.dart';
import '../aboutus.dart';

class Profile extends StatefulWidget {
  final String uid;
  const Profile({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final Stream<UserModel?> userModelStream;
  Stream<List<Doctor>>? _listDoctor;

  String text = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "My Profile",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 20),
              Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.blue.shade50,
                    height: 55,
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 230),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 180,
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
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
                        print(snapshot.data);
                        if (snapshot.data != null) {
                          UserModel user = snapshot.data!;
                          return Column(
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
                                  Text(
                                    '${user.age} years |',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '  ${user.gender}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              )
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
                  color: Colors.blue.shade50,
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
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GridList(uid: widget.uid)));
                        },
                        child: Text("BOOK"),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(6.0))),
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
                    SingleChildScrollView(
                      child: Container(
                        width: 330,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Whats on your mind today?",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Start Writing!",
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  onChanged: (val) {
                                    setState(() {
                                      text = val;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
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
                                MaterialStateProperty.all(Colors.blue),
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
                                MaterialStateProperty.all(Colors.blue),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(500, 20)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )))),
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
