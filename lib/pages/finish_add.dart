import 'package:diploma/pages/home.dart';
import 'package:flutter/material.dart';

class FinishAdd extends StatelessWidget {
  const FinishAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 350.0, left: 16, right: 16),
          child: Center(
            child: Text(
              '       Объявление успешно добавлено',
              style: TextStyle(color: Color(0xff83C17F), fontSize: 36),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 10),
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('Вернутьс на главный экран', style: TextStyle(fontSize: 24),)),
        )
      ]),
    );
  }
}
