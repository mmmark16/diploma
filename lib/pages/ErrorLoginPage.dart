import 'package:flutter/material.dart';
class ErrorLoginPages extends StatelessWidget {
  const ErrorLoginPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ОШИБКА АВТОРИЗАЦИИ",
          style: TextStyle(color: Color(0xff246E46)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Ошибка авторизации проверьте пароль и имя пользователя',
              style: TextStyle(color: Color(0xff246E46), fontSize: 32),
          ),
        ),
      ),
    );
  }
}
