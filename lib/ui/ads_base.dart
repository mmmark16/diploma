import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class AdsBase extends StatelessWidget {
  final String image;
  final String title;
  final String cost;
  final String description;
  final String address;
  final String contacts;
  final DateTime pubDate;
  final int author;
  final double square;
  final bool fridge;

  const AdsBase({required this.image,
    required this.title,
    required this.cost,
    required this.description,
    required this.address,
    required this.contacts,
    required this.pubDate,
    required this.author,
    required this.square,
    required this.fridge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Color(0xff246E46),
            ),
            tooltip: 'Назад',
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          title,
          style: TextStyle(color: Color(0xff246E46)),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: LikeButton(
              size: 24,
              circleColor:
              CircleColor(start: Color(0xff83C17F), end: Color(0xff246E46)),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Color(0xff246E46),
                dotSecondaryColor: Color(0xff246E46),
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Color(0xff246E46) : Colors.white,
                  size: 24,
                );
              },
            ),
          ),
        ],
      ),
      body: ListView(
          children: [
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Image.asset(image),
      ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16),
    child: Text(
    'Цена: ${cost}',
    style: TextStyle(fontSize: 28, color: Color(0xff246E46)),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 26),
    child: Text(
    description,
    style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 26),
    child: Text(
    square.toString(),
    style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 26),
    child: Text('Наличие холодильника ${fridge}',
    style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
    ),
    ),
    ],
    )
    ,
    );
  }
}
