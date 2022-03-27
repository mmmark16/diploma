import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "ГЛАВНАЯ",
            style: TextStyle(color: Color(0xff246E46)),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                shadowColor: Colors.green,
                elevation: 8,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          right: 8,
                          top: 8,
                          child:  LikeButton(
                            size: 24,
                            circleColor:
                            CircleColor(start: Color(0xff83C17F), end: Color(0xff83C17F)),
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
                        Ink.image(
                          image: NetworkImage(
                            'http://www.norgran.ru/upload/iblock/d48/d489be90f379373bb7ba395f8eee10e4.jpg',
                          ),
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text(
                            'Квартира в ЖК Самоцветы',
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
                      padding: EdgeInsets.only(left: 16, top: 12).copyWith(bottom: 0),
                      child: Text(
                        '20000 руб./мес',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 8).copyWith(bottom: 0),
                      child: Text(
                        'Уютная 2-х комнатная квартира',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 16),
                      child: TextButton(
                        child: Text('Просмотреть объявление', style: TextStyle(fontSize: 16)),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
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
                        Positioned(
                          right: 8,
                          top: 8,
                          child:  LikeButton(
                            size: 24,
                            circleColor:
                            CircleColor(start: Color(0xff83C17F), end: Color(0xff83C17F)),
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
                        Ink.image(
                          image: NetworkImage(
                            'https://ecpu.ru/new-buildings/rostov-na-donu/1076/zhk-zvezdnyy-rostov-na-donu-logo.jpg',
                          ),
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text(
                            'Квартира в ЖК на Зведной',
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
                      padding: EdgeInsets.only(left: 16, top: 12).copyWith(bottom: 0),
                      child: Text(
                        '35000 руб./мес',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 8).copyWith(bottom: 0),
                      child: Text(
                        'Уютная 2-х комнатная квартира для нормальный пацанов играющих в доту',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 16),
                      child: TextButton(
                        child: Text('Просмотреть объявление', style: TextStyle(fontSize: 16)),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 10,
              indent: 32,
              endIndent: 12,
              color: Color.fromRGBO(235, 235, 235, 1),
            ),
            Padding(
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
                        Positioned(
                          right: 8,
                          top: 8,
                          child:  LikeButton(
                            size: 24,
                            circleColor:
                            CircleColor(start: Color(0xff83C17F), end: Color(0xff83C17F)),
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
                        Ink.image(
                          image: NetworkImage(
                            'https://static.ngs.ru/news/2020/99/preview/52ecd8ce6ebac947cd29936d97094f0f09c6d50b_2362_1487.jpg',
                          ),
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text(
                            'Квартира в ЖК на Купчино',
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
                      padding: EdgeInsets.only(left: 16, top: 12).copyWith(bottom: 0),
                      child: Text(
                        '60000 руб./мес',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 8).copyWith(bottom: 0),
                      child: Text(
                        'Уютная 5-и комнатная квартира для нян девочек',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 16),
                      child: TextButton(
                        child: Text('Просмотреть объявление', style: TextStyle(fontSize: 16)),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
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
                        Positioned(
                          right: 8,
                          top: 8,
                          child:  LikeButton(
                            size: 24,
                            circleColor:
                            CircleColor(start: Color(0xff83C17F), end: Color(0xff83C17F)),
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
                        Ink.image(
                          image: NetworkImage(
                            'http://www.norgran.ru/upload/iblock/d48/d489be90f379373bb7ba395f8eee10e4.jpg',
                          ),
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text(
                            'Квартира в ЖК находящиеся в Санкт-Петербурге',
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
                      padding: EdgeInsets.only(left: 16, top: 12).copyWith(bottom: 0),
                      child: Text(
                        '20000 руб./мес',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 8).copyWith(bottom: 0),
                      child: Text(
                        'Уютная 2-х комнатная квартира',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 16),
                      child: TextButton(
                        child: Text('Просмотреть объявление', style: TextStyle(fontSize: 16)),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
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
                        Positioned(
                          right: 8,
                          top: 8,
                          child:  LikeButton(
                            size: 24,
                            circleColor:
                            CircleColor(start: Color(0xff83C17F), end: Color(0xff83C17F)),
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
                        Ink.image(
                          image: NetworkImage(
                            'http://www.norgran.ru/upload/iblock/d48/d489be90f379373bb7ba395f8eee10e4.jpg',
                          ),
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text(
                            'Квартира в ЖК Самоцветы',
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
                      padding: EdgeInsets.only(left: 16, top: 12).copyWith(bottom: 0),
                      child: Text(
                        '20000 руб./мес',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 8).copyWith(bottom: 0),
                      child: Text(
                        'Уютная 2-х комнатная квартира',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 16),
                      child: TextButton(
                        child: Text('Просмотреть объявление', style: TextStyle(fontSize: 16)),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
