import 'package:envision/screens/forum.dart';
import 'package:envision/screens/postDisplay.dart';
import 'package:envision/sevices/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton.icon(
            label: const Text("Sign Out"),
            icon: Icon(Icons.person),
            onPressed: () async {_auth.signOut();})],
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Forum()),
          ); },
        ),
      )
    );
  }
}
