import 'dart:ui';

import 'package:diploma/add_adv.dart';
import 'package:diploma/main.dart';
import 'package:diploma/pages/home.dart';
import 'package:flutter/material.dart';

class UserPr extends StatelessWidget {
  const UserPr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 138.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.25), // border color
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(2), // border width
                child: Container(
                  // or ClipRRect if you need to clip the content
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff83C17F), // inner circle color
                  ),
                  child: Icon(
                    Icons.person,
                    size: 72, // inner content
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 24, bottom: 24),
            child: Text(
              'Логин: Usertest',
              style: TextStyle(fontSize: 24, color: Color(0xff83C17F)),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Новых сообщений: 0',
              style: TextStyle(fontSize: 24, color: Color(0xff83C17F)),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Ваших объявлений: 0',
              style: TextStyle(fontSize: 24, color: Color(0xff83C17F)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Add_adv()));
                },
                child: const Text(
                  "Создать объявление",
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
