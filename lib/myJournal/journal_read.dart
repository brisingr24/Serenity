// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JournalRead extends StatefulWidget {
  JournalRead(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  _JournalReadState createState() => _JournalReadState();
}

class _JournalReadState extends State<JournalRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF9494),
      appBar: AppBar(
        backgroundColor: Color(0xFfFF9494),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doc["note_title"],
              ),
              Text(
                widget.doc["creation_date"],
              ),
              Text(
                widget.doc["note_content"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
