import 'package:diploma/pages/home.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Camera.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 350.0, left: 16, right: 16),
          child: Center(
            child: Text(
              'Осталось добавить фотографию',
              style: TextStyle(color: Color(0xff83C17F), fontSize: 36),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 10),
          child: GestureDetector(
            child: Container(
              height: 42,
              child: const Center(
                  child: Text(
                    'Добавить фотографию',
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
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Camera()),
              );
            },
          ),
          /*TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp(login: true)),
                );
              },
              child: Text('Вернутьс на главный экран', style: TextStyle(fontSize: 24),)),*/
        )
      ]),
    );
  }
}
