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

  Future getImage(int type) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null && type == 0) {
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
                await _userService.updateProfile(_profileImg!, name);
                Navigator.pop(context);
                setState(() {});
              },
              child: Text("SAVE"))
        ],
      ),
      body: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () => getImage(0),
                child: _profileImg == null
                    ? const Icon(Icons.person_add_alt_1_rounded)
                    : Image.file(
                        _profileImg!,
                        height: 100,
                      )),
            SizedBox(height: 20,),
            TextFormField(
              onChanged: (val) => setState(() {
                name = val;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
