import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma/model/Profile.dart';
import 'package:diploma/model/UserApi.dart';
import 'package:diploma/pages/chat.dart';
import 'package:diploma/services/remote_services.dart';
import 'package:diploma/ui/conveniences.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../messenger/helper/constans.dart';
import '../messenger/servisec/database.dart';
import '../messenger/views/conversation.dart';

class AdsBase extends StatefulWidget {
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

  @override
  State<AdsBase> createState() => _AdsBaseState();
}

class _AdsBaseState extends State<AdsBase> {
  String check(bool filters) {
    if (filters == true) {
      return 'есть';
    } else {
      return 'отсутствует';
    }
  }

  DatabaseMethods databaseMethods = DatabaseMethods();

  TextEditingController searchEditingController = TextEditingController();

  QuerySnapshot? searchSnapshot;

  bool isLoading = false;

  bool haveUserSearched = false;

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  createChatRoomAndStartConversation(String userName)async{
    if(userName != Constants.myName){
      setState(() {
        isLoading = true;
      });
      String chatroomId = getChatRoomId(Constants.myName,userName);
      List<String> users = [Constants.myName,userName];
      Map<String, dynamic>chatRoomMap = {
        'users': users,
        'chatroomID': chatroomId
      };
      await databaseMethods.createChatRoom(chatRoomMap,chatroomId);
      Navigator.push(this.context, MaterialPageRoute(
          builder: (context) => Conversation(chatroomId:chatroomId,userName: userName,)));
    }else{
      print('you can not send message');
      showDialog<String>(
          context: this.context,
          builder: (BuildContext context) => AlertDialog(
              title: Text('Ошибка'),
              content: Text('Вы не можете начать чат с собой'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {Navigator.pop(context, 'OK');},
                  child: const Text('OK'),
                ),]

          ));
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
          widget.title,
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
                imageUrl: widget.image,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset('assets/error.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Text(
              'Цена: ${widget.cost} рублей в месяц',
              style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Адрес: ${widget.address}',
              style: TextStyle(fontSize: 20, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Описание: ${widget.description}',
              style: TextStyle(fontSize: 20, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Площадь: ${widget.square.toString()} м2',
              style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Этаж: ${widget.floor}/${widget.floors}',
              style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 26),
            child: Text(
              'Связаться: ${widget.contacts}',
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
                    visible: widget.fridge,
                    icon: Icons.ac_unit,
                  ),
                  Conveniences(
                    text: 'Микроволновка',
                    visible: widget.microwave,
                    icon: Icons.microwave,
                  ),
                  Conveniences(
                    text: 'Стиральная машина',
                    visible: widget.washMachine,
                    icon: Icons.water_drop,
                  ),
                  Conveniences(
                    text: 'Печь',
                    visible: widget.oven,
                    icon: Icons.bakery_dining,
                  ),
                  Conveniences(
                    text: 'Кондиционер',
                    visible: widget.conditioner,
                    icon: Icons.air,
                  ),
                  Conveniences(
                    text: 'Роутер',
                    visible: widget.router,
                    icon: Icons.wifi,
                  ),
                  Conveniences(
                    text: 'Телевизор',
                    visible: widget.tv,
                    icon: Icons.tv,
                  ),

                ],
              ),
            ),
          ),
          TextButton(onPressed: () async {
            Profile profileid = await RemoteService().getProfileById(widget.author);
            String user = profileid.results[0].username;
            log(user, name: "вот этот пользователь создал объявление");
            createChatRoomAndStartConversation(user);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Chat(
                      title: user)),
            );

          }, child: Text('Связаться с владельцем')),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Объявление создано: ${widget.pubDate.toString().substring(0, 19)}'),
          )
        ],
      ),
    );
  }
}
