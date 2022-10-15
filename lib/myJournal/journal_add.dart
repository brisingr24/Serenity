// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class JournalAdd extends StatefulWidget {
  JournalAdd(this.uid,{Key? key}) : super(key: key);
  String uid;
  @override
  _JournalAddState createState() => _JournalAddState();
}

class _JournalAddState extends State<JournalAdd> {

  final TextEditingController _title = TextEditingController();
  final TextEditingController _main = TextEditingController();
  String date = DateFormat.yMMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text("Add a New Note",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightBlue.shade50,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          TextFormField(
                controller: _title,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            SizedBox(height: 10,),
            Text(date,style: TextStyle(fontSize: 16),),
            SizedBox(height: 10,),
            TextFormField(
              controller: _main,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Start Writing!",
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await FirebaseFirestore.instance.collection("users").doc(widget.uid).collection("journal").add({
            'creation_date': date,
            'note_content': _main.text,
            'note_title': _title.text,
          }).then((value){
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Failed cuz ${error}"));

        },
        child: Icon(Icons.save),
      ),
    );
  }
}
