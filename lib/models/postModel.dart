import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String id;
  String text;
  String creator;
  Timestamp? timestamp;

  PostModel({required this.id, required this.text,required this.creator, this.timestamp});
}