import 'package:envision/screens/bookings/book_time.dart';
import 'package:flutter/material.dart';

class DatePage extends StatefulWidget {
  const DatePage({Key? key}) : super(key: key);

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(_dateTime.toString(), style: TextStyle(fontSize: 30)),
              MaterialButton(
                onPressed: _showDatePicker,
                child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )),
                color: Colors.blue,
              ),
              RaisedButton(onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TimePage()),
                );
              },
                child: Text("Next"),
              )
            ],
          ),
        ));
  }
}
