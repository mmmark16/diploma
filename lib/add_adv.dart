import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add_adv extends StatelessWidget {
  TextEditingController _controllertitle = TextEditingController();
  TextEditingController _controllercost = TextEditingController();
  TextEditingController _controlleraddress = TextEditingController();
  TextEditingController _controllerdescription = TextEditingController();
  TextEditingController _controllercontact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBar(
            title: Text(
              'Создание объявления',
              style: TextStyle(color: Color(0xff246E46)),
            ),
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Color(0xff246E46),
                ),
                tooltip: 'Назад',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Название',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controllertitle,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите название",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Цена',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controllercost,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Укажите стоимость",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Расположение',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controlleraddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите адрес",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Об объекте',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
              cursorColor: Colors.black,
                controller: _controllerdescription,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите описание",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Контакты',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controllercontact,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите свои контакты",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(color: Color(0xff83C17F), borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 7,
                  offset: Offset(2, 5), // changes position of shadow
                ),
              ],),
            ),
          )
        ],
      ),
    );
  }
}
