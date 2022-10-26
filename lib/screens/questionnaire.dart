// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {

  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;
  String chk="";
  final q1 = TextEditingController();
  String q1a = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: PageView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: 400,
                  height: 590,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Multiple Select Option',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        CheckboxListTile(
                          title:  const Text(
                            'Question 1',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          value: a,
                          onChanged: (value) {
                            setState(() {
                              a = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title:  const Text(
                            'Question 2',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          value: b,
                          onChanged: (value) {
                            setState(() {
                              b = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title:  const Text(
                            'Question 3',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          value: c,
                          onChanged: (value) {
                            setState(() {
                              c = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title:  const Text(
                            'Question 4',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          value: d,
                          onChanged: (value) {
                            setState(() {
                              d = value!;
                            });
                          },
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(
                            onPressed: () async => {
                            Fluttertoast.showToast(
                            msg: "SAVED",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                            )
                        },
                            child: const Text(
                              "SUBMIT",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade50),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(150, 20)),
                                shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: 400,
                  height: 590,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Single Choice Option',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        RadioListTile(
                            title: Text("Male"),
                            value: "male",
                            groupValue: chk,
                            onChanged: (value) {
                              setState(() {
                                chk = value.toString();
                              });
                            }),
                        RadioListTile(
                            title: Text("Female"),
                            value: "female",
                            groupValue: chk,
                            onChanged: (value) {
                              setState(() {
                                chk = value.toString();
                              });
                            }),
                        RadioListTile(
                            title: Text("Others"),
                            value: "other",
                            groupValue: chk,
                            onChanged: (value) {
                              setState(() {
                                chk = value.toString();
                              });
                            }),
                        SizedBox(height: 40,),
                        ElevatedButton(
                            onPressed: () async => {
                              Fluttertoast.showToast(
                                  msg: "SAVED",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              )
                            },
                            child: const Text(
                              "SUBMIT",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade50),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(150, 20)),
                                shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: 400,
                  height: 490,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Input Based Questions',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        TextFormField(
                          controller: q1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Type here",
                            prefixIcon: Icon(Icons.text_fields),
                          ),
                          onChanged: (val) => setState(() {
                            q1a = val;
                          }),
                          keyboardType: TextInputType.multiline,
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(
                            onPressed: () async => {
                              Fluttertoast.showToast(
                                  msg: "SAVED",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              )
                            },
                            child: const Text(
                              "SUBMIT",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(6.0),
                                backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade50),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(150, 20)),
                                shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
