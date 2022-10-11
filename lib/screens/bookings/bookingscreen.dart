import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:envision/screens/bookings/bookconfirm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({Key? key, required this.uid, required this.docID})
      : super(key: key);
  String docID;
  String uid;
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;

  //String _initialValue = '';

  String _valueChanged3 = '';
  String _valueToValidate3 = '';
  String _valueSaved3 = '';
  String _valueChanged4 = '';
  String _valueToValidate4 = '';
  String _valueSaved4 = '';

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    // _initialValue = DateTime.now().toString();
    // _controller1 = TextEditingController(text: DateTime.now().toString());
    // _controller2 = TextEditingController(text: DateTime.now().toString());
    _controller3 = TextEditingController(text: DateTime.now().toString());

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    _controller4 = TextEditingController(text: '$lsHour:$lsMinute');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
        backgroundColor: Color(0xFFFFD1D1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _oFormKey,
          child: Column(
            children: <Widget>[
              DateTimePicker(
                type: DateTimePickerType.date,
                //dateMask: 'yyyy/MM/dd',
                controller: _controller3,
                //initialValue: _initialValue,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                locale: Locale('en', 'IN'),
                onChanged: (val) => setState(() => _valueChanged3 = val),
                validator: (val) {
                  setState(() => _valueToValidate3 = val ?? '');
                  return null;
                },
                onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
              ),
              DateTimePicker(
                type: DateTimePickerType.time,
                //timePickerEntryModeInput: true,
                controller: _controller4,
                // initialValue: '', //_initialValue,
                icon: Icon(Icons.access_time),
                timeLabelText: "Time",
                use24HourFormat: false,
                locale: Locale('en', 'IN'),
                onChanged: (val) => setState(() => _valueChanged4 = val),
                validator: (val) {
                  setState(() => _valueToValidate4 = val ?? '');
                  return null;
                },
                onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () async {
                    final loForm = _oFormKey.currentState;

                    if (loForm?.validate() == true) {
                      loForm?.save();
                    }
                    await confirmBooking();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingConfirm()),
                    );
                  },
                  child: Text('Book Now'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffFF9494)),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(100, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )))),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    final loForm = _oFormKey.currentState;
                    loForm?.reset();

                    setState(() {
                      _valueChanged3 = '';
                      _valueChanged4 = '';

                      _valueToValidate3 = '';
                      _valueToValidate4 = '';

                      _valueSaved3 = '';
                      _valueSaved4 = '';
                    });

                    _controller3.clear();
                    _controller4.clear();
                  },
                  child: Text('Reset'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFFF9494)),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(100, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )))),
            ],
          ),
        ),
      ),
    );
  }

  confirmBooking() async {
    await FirebaseFirestore.instance
        .collection("doctor")
        .doc(widget.docID)
        .update({
      "isBooked": true,
      "requesterId": widget.uid,
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .update({
      "booked": true,
      "docID": widget.docID,
    });
  }
}
