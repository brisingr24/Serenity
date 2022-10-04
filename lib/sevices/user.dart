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
    ) :UserModel(name:"User");
  }

  Stream<UserModel?> getUserInfo(uid){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(_userFromFirebaseSnapshot);
  }

  Future <void> updateProfile (File _profileImg,String name) async {

    String profileImgURL = "";

    if(_profileImg != null){
      //save image to storage
      profileImgURL = await _utilsService.uploadFile(_profileImg,'user/profile/${FirebaseAuth.instance.currentUser?.uid}/profile');
    }

    Map<String,Object> data = HashMap();
    if (name != '') data['name'] = name;
    if (profileImgURL != '') data['profileImgURL'] = profileImgURL;

    await FirebaseFirestore.instance
    .collection('users')
    .doc(FirebaseAuth.instance.currentUser?.uid)
    .update(data);
  }
}