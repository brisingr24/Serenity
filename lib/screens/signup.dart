// ignore_for_file: prefer_const_constructors

import 'package:envision/sevices/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  String email = '';
  String pass = '';
  bool isPasswordVisible = false;

  void showPass() {
    isPasswordVisible = !isPasswordVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Signup")),
      ),
      body: Form(
        child: Column(
          children: [
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "abc@abc.com",
                labelText: " Email",
                prefixIcon: Icon(Icons.mail_outline),
              ),
              onChanged: (val) => setState(() {
                email = val;
              }),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter password here",
                labelText: " Password",
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  icon: isPasswordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    showPass();
                  },
                ),
              ),
              obscureText: isPasswordVisible,
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
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async => {
                      await _auth.signIn(email, pass),
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
          ],
        ),
      ),
    );
  }
}
