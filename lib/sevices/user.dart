import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envision/models/userModel.dart';
import 'package:envision/sevices/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService{

  UtilsService _utilsService = UtilsService();

  UserModel? _userFromFirebaseSnapshot(DocumentSnapshot<dynamic> snapshot){
    return snapshot != null
        ?UserModel(
      id: snapshot.id,
      profileImgURL: snapshot.data()['profileImgURL'],
      name: snapshot.data()['name'],
      email: snapshot.data()['email'],
      city: snapshot.data()['city'],
      age: snapshot.data()['age'],
      gender: snapshot.data()['gender'],
    ) :UserModel(name:"User");
  }

  Stream<UserModel?> getUserInfo(uid){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(_userFromFirebaseSnapshot);
  }

  Future <void> updateProfile (File _profileImg,String name,String city,String age,String gender) async {

    String profileImgURL = "";

    if(_profileImg != null){
      //save image to storage
      profileImgURL = await _utilsService.uploadFile(_profileImg,'user/profile/${FirebaseAuth.instance.currentUser?.uid}/profile');
    }

    Map<String,Object> data = HashMap();
    if (name != '') data['name'] = name;
    if (profileImgURL != '') data['profileImgURL'] = profileImgURL;
    if (city != '') data['city'] = city;
    if (age != '') data['age'] = age;
    if (gender != '') data['gender'] = gender;


    await FirebaseFirestore.instance
    .collection('users')
    .doc(FirebaseAuth.instance.currentUser?.uid)
    .update(data);
  }
}