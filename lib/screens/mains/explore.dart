import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/gameCard.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  Widget buildCard({required CardItem item,}) => Container(
        width: 200,
        color: Colors.blue,
    child: Column(
      children: [
        Expanded(child: Image.asset(item.img,fit: BoxFit.cover,)),
        SizedBox(height: 5,),
        Text(item.title,style: TextStyle(color: Colors.white),),
      ],
    ),
      );

  List<CardItem> items = [
    CardItem(
      img: 'images/valo.png',
      title: 'Valorant',
    ),
    CardItem(
      img: 'valo.png',
      title: 'Valorant',
    ),
    CardItem(
      img: 'valo.png',
      title: 'Valorant',
    ),
    CardItem(
      img: 'valo.png',
      title: 'Valorant',
    ),
    CardItem(
      img: 'valo.png',
      title: 'Valorant',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text("Games",style: TextStyle(fontSize: 28),),
                Container(
                    height: 150,
                    width: 600,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 20,
                      ),
                      itemBuilder: (context, index) => buildCard(item: items[index]),
                    )),
                SizedBox(height: 50),
                Text("Music",style: TextStyle(fontSize: 28),),
                Container(
                    height: 100,
                    width: 600,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 20,
                      ),
                      itemBuilder: (context, index) => buildCard(item: items[index]),
                    )),
                SizedBox(height: 50),
                Text("Books",style: TextStyle(fontSize: 28),),
                Container(
                    height: 100,
                    width: 600,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (context, _) => SizedBox(
                        width: 20,
                      ),
                      itemBuilder: (context, index) => buildCard(item: items[index]),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
