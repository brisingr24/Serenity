import 'package:envision/sevices/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  String email='';
  String pass='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Signup")),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (val) => setState(() {
                  email=val;
                }),
              ),
              TextFormField(
                onChanged: (val) => setState(() {
                  pass=val;
                }),
              ),
              RaisedButton(
                  child: Text("SIGN UP"),
                  onPressed: () async => {
                    _auth.signUp(email, pass),
                  }),
              SizedBox(height: 50,),
              RaisedButton(
                  child: Text("LOG IN"),
                  onPressed: () async => {
                    _auth.signIn(email, pass),
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
