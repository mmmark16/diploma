import 'package:diploma/clockput.dart';
import 'package:diploma/loadscreen.dart';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('УСТАНОВКА БУДИЛЬНИКА', style: TextStyle(color: Color(0xff246E46)),),
    ),
      body: ListView(
        children: [
          Container(
            height: 26,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Место жительства',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите место жительства",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Место работы/учебы',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите место работы/учебы",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Время сборов',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
              keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите время сборов в минутах",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Время прибытия (12:00 = 1200)',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите к которому необходимо приехать",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
            child: GestureDetector(
              child: Container(
                height: 42,
                child: const Center(
                    child: Text(
                      'Установить будильник',
                      style: TextStyle(color: Color(0xff246E46), fontSize: 24),
                    )),
                decoration: const BoxDecoration(
                  color: Color(0xff83C17F),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      blurRadius: 7,
                      offset: Offset(2, 5),
                    ),
                  ],
                ),
              ),
              onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoadScreen()),
              );},
            ),
          )
        ],
      ),
    );
  }
}
