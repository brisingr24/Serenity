import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget JournCard(Function()?onTap,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(doc["note_title"],),
          Text(doc["note_content"],),
        ],
      ),
    ),
  );
}
