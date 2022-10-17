import 'package:envision/screens/bookings/bookingscreen.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  Contact(
      {Key? key,
      required this.docID,
      required this.uid,
      this.name,
      this.profession,
      this.city,
      this.rating})
      : super(key: key);
  String docID;
  String uid;
  String? name;
  String? profession;
  String? city;
  String? rating;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: 170,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: CircleAvatar(
                    child: Image.asset("images/girl.jpg"),
                    radius: 30,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Text(
                    "${widget.profession}",
                    style: TextStyle(fontSize: 12),
                  ),
                  flex: 3,
                ),
                Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("${widget.city}"),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9494),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      width: 70,
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.rating}"),
                          Icon(Icons.star),
                        ],
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xFFFF9494),
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                          docID: widget.docID,
                          uid: widget.uid,
                        ),
                      ),
                    );
                  },
                  child: const Text("Book Now"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFFF9494)),
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFFFE3E1),
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }
}
