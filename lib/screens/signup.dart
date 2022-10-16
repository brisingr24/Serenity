// ignore_for_file: prefer_const_constructors

import 'package:envision/sevices/auth.dart';
import 'package:envision/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<AuthService>(
      create: (context) => AuthService(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.fill,
            )),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WELCOME",style: TextStyle(fontSize: 40,fontFamily: 'peralta',letterSpacing: 4,color: Colors.black,),),
                    SizedBox(height: 30),
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
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    Consumer<AuthService>(
                      builder: (context, provider, child) {
                        return TextFormField(
                          controller: provider.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Name",
                            labelText: "Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Consumer<AuthService>(builder: (context, provider, child) {
                        return ElevatedButton(
                            onPressed: () async => {
                              provider.getName(),
                              provider.signUp(email, pass),
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) =>Wrapper()))
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
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(150, 20)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))));
                      }),
                      SizedBox(width: 20,),
                      ElevatedButton(
                          onPressed: () async => {
                            await _auth.signIn(email, pass),
                          Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>Wrapper()))
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
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(150, 20)),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )))),
                    ],),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
