import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () async {
            try {
              dynamic conversationObject = {
                'appId': '245bd44f458f1551edc13318cb616e21c'
              };
              dynamic result = await KommunicateFlutterPlugin
                  .buildConversation(conversationObject);
              print("Conversation builder success : " +
                  result.toString());
            } on Exception catch (e) {
              print("Conversation builder error occurred : " +
                  e.toString());
            }
          },
          child: const Text(
            "Chatbot",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(Colors.black),
              fixedSize: MaterialStateProperty.all<Size>(
                  const Size(90, 40)),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )))),
    );
  }
}
