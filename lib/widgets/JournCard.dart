import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget JournCard(Function()?onTap,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.amber.shade300,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(doc["note_title"],),
          SizedBox(height: 80,),
          Align(alignment:Alignment.bottomRight,child: Text(doc["creation_date"],)),
        ],
      ),
    ),
  );
}
