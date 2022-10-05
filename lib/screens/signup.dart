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
  String email = '';
  String pass = '';

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
                  email = val;
                }),
              ),
              TextFormField(
                onChanged: (val) => setState(() {
                  pass = val;
                }),
              ),
              ElevatedButton(
                  onPressed: () async => {
                        _auth.signUp(email, pass),
                      },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(6.0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade50),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(150, 20)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )))),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async => {
                        _auth.signIn(email, pass),
                      },
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(6.0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade50),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(150, 20)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )))),
              // RaisedButton(
              //     child: Text("SIGN UP"),
              //     onPressed: () async => {
              //       _auth.signUp(email, pass),
              //     }),
              // SizedBox(height: 50,),
              // RaisedButton(
              //     child: Text("LOG IN"),
              //     onPressed: () async => {
              //       _auth.signIn(email, pass),
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
