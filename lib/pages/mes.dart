import 'dart:ui';
import 'package:flutter/material.dart';

class MS extends StatefulWidget {
  const MS({Key? key}) : super(key: key);

  @override
  _MS createState() => _MS();
}

class _MS extends State<MS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("ЧАТЫ", style: TextStyle(
            color: Color(0xff246E46)
        ),),

      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}