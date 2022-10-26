import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {

  String? id;
  String? profileImgURL;
  String? name;
  String? email;
  String? city;
  String? age;
  String? gender;
  String? phone;
  String? docID;
  bool? booked;

  UserModel({this.id, this.profileImgURL, this.name, this.email,this.city,this.age,this.gender,this.phone,this.booked,this.docID}){
    notifyListeners();
  }
}