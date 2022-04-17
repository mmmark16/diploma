import 'package:cached_network_image/cached_network_image.dart';
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
  final bool fridge;
  final bool microwave;
  final bool washMachine;
  final bool oven;
  final bool conditioner;
  final bool router;
  final bool tv;

  const Ads(
      {required this.image,
      required this.title,
      required this.cost,
      required this.description,
      required this.address,
      required this.contacts,
      required this.pubDate,
      required this.author,
      required this.square,
      required this.fridge,
      required this.microwave,
      required this.washMachine,
      required this.oven,
      required this.conditioner,
      required this.router,
      required this.tv});

  String loadimage(String images){
    if (images == null){
      images = 'https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/g5nq3mokuc8fvn3jpfvu.png';
    }
    return images;
  }

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

                CachedNetworkImage(
                  imageUrl: loadimage(image),
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
              child: Text('Цена: ${cost} руб. в месяц',
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
                              address: address,
                              square: square,
                              fridge: fridge,
                              router: router,
                              microwave: microwave,
                              oven: oven,
                              washMachine: washMachine,
                              tv: tv,
                              conditioner: conditioner,
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
