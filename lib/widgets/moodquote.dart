import 'package:flutter/material.dart';

class MoodQuote extends StatefulWidget {
  const MoodQuote({Key? key, this.quote, this.author}) : super(key: key);
  final String? quote;
  final String? author;

  @override
  State<MoodQuote> createState() => _MoodQuoteState();
}

class _MoodQuoteState extends State<MoodQuote> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('images/happyBackground.jpg')),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(widget.quote ??"Unable to load",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),),
          
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(widget.author ??"Unable to load",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
            
          ),
        )
      ],
    );
  }
}
