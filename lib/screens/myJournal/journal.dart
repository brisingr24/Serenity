// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:envision/screens/myJournal/journal_add.dart';
import 'package:envision/screens/myJournal/journal_edit.dart';
import '../../widgets/JournCard.dart';

class Journal extends StatefulWidget {
  Journal(this.uid, {Key? key}) : super(key: key);
  String uid;
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF9494),
        title: Text("MY JOURNAL"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Text(
                  "My Notes",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'peralta'),
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(widget.uid)
                    .collection("journal")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => JournCard(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JournalEditor(
                                          note, widget.uid, note.id)),
                                );
                              }, note))
                          .toList(),
                    );
                  }
                  return Text(
                    "There's No Notes",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFFF9494),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JournalAdd(widget.uid)),
          );
        },
        label: Text("Add Note"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
