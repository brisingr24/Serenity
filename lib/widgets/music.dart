import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class music_container extends StatelessWidget {
  music_container({
    Key? key,
    required this.url,
  }) : super(key: key);

  String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        height: 100,
        child: InkWell(
          child: Image.asset("images/spotify.png"),
          onTap: () => launch("$url"),
        ),
      ),
    );
  }
}

class books_container extends StatelessWidget {
  books_container({Key? key, required this.image, required this.url})
      : super(key: key);

  String image;
  String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: InkWell(
        child: Image.asset("$image"),
        onTap: () => launch("$url"),
      ),
    );
  }
}

class more_container extends StatelessWidget {
  more_container({Key? key, required this.image, required this.url})
      : super(key: key);

  String image;
  String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 150,
        child: InkWell(
          child: Image.asset("$image"),
          onTap: () => launch("$url"),
        ),
      ),
    );
  }
}
