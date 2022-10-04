import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {



  String? id;
  String? profileImgURL;
  String? name;
  String? email;

  UserModel({this.id, this.profileImgURL, this.name, this.email}){
    notifyListeners();
  }
}