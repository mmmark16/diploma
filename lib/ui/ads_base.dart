import 'package:cached_network_image/cached_network_image.dart';
import 'package:diploma/model/UserApi.dart';
import 'package:diploma/pages/chat.dart';
import 'package:diploma/services/remote_services.dart';
import 'package:diploma/ui/conveniences.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class AdsBase extends StatelessWidget {
  final String image;
  final String title;
  final String cost;
  final String description;
  final String address;
  final String contacts;
  final String pubDate;
  final int author;
  final double square;
  final bool fridge;
  final bool microwave;
  final bool washMachine;
  final bool oven;
  final bool conditioner;
  final bool router;
  final bool tv;
  final int floor;
  final int floors;

  const AdsBase(
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
      required this.tv, required this.floor, required this.floors});

  String check(bool filters) {
    if (filters == true) {
      return 'есть';
    } else {
      return 'отсутствует';
    }
  }

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
              child: /*CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )*/CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset('assets/error.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Text(
              'Цена: ${cost} рублей в месяц',
              style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Адрес: ${address}',
              style: TextStyle(fontSize: 20, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Описание: ${description}',
              style: TextStyle(fontSize: 20, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Площадь: ${square.toString()} м2',
              style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Этаж: ${floor}/${floors}',
              style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Связаться: ${contacts}',
              style: TextStyle(fontSize: 20, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'УДОБСТВА: ',
              style: TextStyle(fontSize: 20, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(67, 66, 68, 0.08), blurRadius: 24)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                  ),
                  Conveniences(
                    text: 'Холодильник',
                    visible: fridge,
                    icon: Icons.ac_unit,
                  ),
                  Conveniences(
                    text: 'Микроволновка',
                    visible: microwave,
                    icon: Icons.microwave,
                  ),
                  Conveniences(
                    text: 'Стиральная машина',
                    visible: washMachine,
                    icon: Icons.water_drop,
                  ),
                  Conveniences(
                    text: 'Печь',
                    visible: oven,
                    icon: Icons.bakery_dining,
                  ),
                  Conveniences(
                    text: 'Кондиционер',
                    visible: conditioner,
                    icon: Icons.air,
                  ),
                  Conveniences(
                    text: 'Роутер',
                    visible: router,
                    icon: Icons.wifi,
                  ),
                  Conveniences(
                    text: 'Телевизор',
                    visible: tv,
                    icon: Icons.tv,
                  ),

                ],
              ),
            ),
          ),
          TextButton(onPressed: () async {
            UserApi usert = await RemoteService().getUserApiforID(author);
            String user = usert.username;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Chat(
                      title: user)),
            );
          }, child: Text('Связаться с владельцем')),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Объявление создано: ${pubDate.toString().substring(0, 19)}'),
          )
        ],
      ),
    );
  }
}
