// ignore_for_file: prefer_const_constructors

import 'package:envision/sevices/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final UserService _userService = UserService();

  File? _profileImg;
  final picker = ImagePicker();
  String name = "";
  String city = "";
  String age = "";
  String gender = "";
  String phone = "";

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _profileImg = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () async {
                await _userService.updateProfile(
                     name, city, age, gender, phone);
                Navigator.pop(context);
                setState(() {});
              },
              child: Text("SAVE"))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "ADD PROFILE PICTURE!",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () => getImage(),
                  child: _profileImg == null
                      ? const Icon(Icons.person_add_alt_1_rounded)
                      : Image.file(
                          _profileImg!,
                          height: 100,
                        )),
              ElevatedButton(
                  onPressed: () async {
                    await _userService.updatePic(
                        _profileImg!);
                  },
                  child: Text("SAVE PIC")),
              SizedBox(
                height: 20,
              ),
              Text(
                "Edit",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter User Name",
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person_add_alt_1_rounded),
                  ),
                  onChanged: (val) => setState(() {
                    name = val;
                  }),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter City",
                    labelText: "city",
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  onChanged: (val) => setState(() {
                    city = val;
                  }),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Age",
                    labelText: "Age",
                    prefixIcon: Icon(Icons.numbers_sharp),
                  ),
                  onChanged: (val) => setState(() {
                    age = val;
                  }),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Gender",
                    labelText: "Gender",
                    prefixIcon: Icon(Icons.people_rounded),
                  ),
                  onChanged: (val) => setState(() {
                    gender = val;
                  }),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Phone No.",
                    labelText: "Phone",
                    prefixIcon: Icon(Icons.phone),
                  ),
                  onChanged: (val) => setState(() {
                    phone = val;
                  }),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
