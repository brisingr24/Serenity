// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JournalEditor extends StatefulWidget {
  JournalEditor(this.doc, this.uid, this.nid, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  String uid;
  String nid;

  @override
  _JournalEditorState createState() => _JournalEditorState();
}

class _JournalEditorState extends State<JournalEditor> {
  TextEditingController _title = TextEditingController();
  TextEditingController _main = TextEditingController();
  String date = DateTime.now().toString();

  @override
  void initState() {
    _title = TextEditingController(text: widget.doc["note_title"]);
    _main = TextEditingController(text: widget.doc["note_content"]);
    date = widget.doc["creation_date"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E4),
      appBar: AppBar(
        title: Text(
          "Note",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFF9494),
        actions: [
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Color(0xFFFF9494)),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(widget.uid)
                    .collection("journal")
                    .doc(widget.nid)
                    .delete()
                    .then((value) {
                  print("Success");
                  Navigator.pop(context);
                }).catchError((error) => print("Failed cuz ${error}"));
              },
              child: Icon(Icons.delete))
        ],
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
            SizedBox(
              height: 10,
            ),
            Text(
              date,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
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
        backgroundColor: Color(0xFFFF9494),
        onPressed: () async {
          print("hello" + widget.doc.toString());
          await FirebaseFirestore.instance
              .collection("users")
              .doc(widget.uid)
              .collection("journal")
              .doc(widget.nid)
              .update({
            'creation_date': date,
            'note_content': _main.text,
            'note_title': _title.text,
          }).then((value) {
            print("Success");
            Navigator.pop(context);
          }).catchError((error) => print("Failed cuz ${error}"));
        },
        child: Icon(Icons.save, color: Colors.black),
      ),
    );
  }
}
