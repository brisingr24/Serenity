import 'package:flutter/material.dart';

class MoodItem extends StatefulWidget {
  const MoodItem({Key? key, required this.image, required this.moodtext}) : super(key: key);
  final String image;
  final String moodtext;

  @override
  State<MoodItem> createState() => _MoodItemState();
}

class _MoodItemState extends State<MoodItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
        width: 70,
        
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(widget.image), Text(widget.moodtext)],
        ));
  }
}
