import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {

  String? id;
  String? profileImgURL;
  String? name = "User";
  String? email;
  String? city;
  String? age;
  String? gender;

  UserModel({this.id, this.profileImgURL, this.name, this.email,this.city,this.age,this.gender}){
    notifyListeners();
  }
}