import 'package:diploma/ui/ads_base.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Ads extends StatelessWidget {
  final String image;
  final String title;
  final String cost;
  final String description;
  final String address;
  final String contacts;
  final DateTime pubDate;
  final int author;
  final double square;

  const Ads(
      {required this.image,
      required this.title,
      required this.cost,
      required this.description,
      required this.address,
      required this.contacts,
      required this.pubDate,
      required this.author,
      required this.square});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        shadowColor: Colors.green,
        clipBehavior: Clip.antiAlias,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: LikeButton(
                    size: 24,
                    circleColor: CircleColor(
                        start: Color(0xff83C17F), end: Color(0xff83C17F)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xff83C17F),
                      dotSecondaryColor: Color(0xff83C17F),
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
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 12, right: 16)
                  .copyWith(bottom: 0),
              child: Text(
                cost,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16)
                  .copyWith(bottom: 0),
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16),
              child: TextButton(
                child: Text('Просмотреть объявление',
                    style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdsBase(
                              title: title,
                              cost: cost,
                              image: image,
                              description: description,
                              contacts: contacts,
                              author: author,
                              pubDate: pubDate,
                              address: address, square: square,
                            )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
