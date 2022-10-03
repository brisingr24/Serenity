// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:envision/screens/editprofile.dart';
import 'package:envision/screens/bookings/bookconfirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/userModel.dart';
import '../../sevices/user.dart';

class Profile extends StatefulWidget {
  final String uid;
  const Profile({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final Stream<UserModel?> userModelStream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder<UserModel?>(
                stream: UserService().getUserInfo(widget.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    if (snapshot.data != null) {
                      UserModel user = snapshot.data!;
                      return Column(
                      children: [
                      Text('${user.name}'),
                      Text('${user.email}'),
                        Image.network(user.profileImgURL?? ' ',height: 200,width:150,fit: BoxFit.cover,)
                        ],
                      );
                    }
                  }
                  return loadingView();
                },
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 2),
                      spreadRadius: 2, //(x,y)
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingConfirm()),
                  );
                },
                child: Text("BOOK"),
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                child: Text("EDIT"),
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
