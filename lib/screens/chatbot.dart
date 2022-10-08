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

  void initState(){
    super.initState();
    _jumpHome();
  }

  _jumpHome() async{
    await Future.delayed(const Duration(seconds: 3),(){});
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
  }

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeae0d4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.asset("images/splash.jpg"),
          ),
          const SizedBox(height: 30),
          DefaultTextStyle(
              style: TextStyle(
                  fontSize: 30, color: Colors.green, fontFamily: 'Pacifico'),
              child: const Text("Mindfulness")),
        ],
      ),
    );
  }
}
