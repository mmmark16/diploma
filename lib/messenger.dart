import 'dart:ui';
import 'package:flutter/material.dart';

class MS extends StatefulWidget {
  const MS({Key? key}) : super(key: key);

  @override
  _MS createState() => _MS();
}

class _MS extends State<MS> {
  Widget appBarTitle = const Text("ЧАТЫ", style: TextStyle(
    color: Color(0xff246E46)
  ),);

  Icon actionIcon = const Icon(Icons.search, color: Color(0xff246E46));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1EFC2),
      appBar: AppBar(
          centerTitle: true,
          title:appBarTitle,
          actions: <Widget>[
            IconButton(icon: actionIcon,onPressed:(){
              setState(() {
                if ( actionIcon.icon == Icons.search){
                  actionIcon = const Icon(Icons.close, color: Color(0xff246E46));
                  appBarTitle = const TextField(
                    style: TextStyle(
                      color: Color(0xff246E46),

                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Color(0xff246E46)),
                        hintText: "Поиск...",
                        hintStyle: TextStyle(color: Color(0xff246E46))
                    ),
                  );}
                else {
                  actionIcon = const Icon(Icons.search,  color: Color(0xff246E46));
                  appBarTitle = const Text("ЧАТЫ", style: TextStyle(
                      color: Color(0xff246E46)
                  ),);
                }
              });
            } ,),]
      ),
    );
  }
}