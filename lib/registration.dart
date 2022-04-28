import 'dart:developer';

import 'package:diploma/login.dart';
import 'package:diploma/main.dart';
import 'package:diploma/model/Token.dart';
import 'package:diploma/model/UserApi.dart';
import 'package:diploma/pages/UserPage.dart';
import 'package:diploma/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class REG extends StatelessWidget {
  late UserApi _user;
  late Token _token;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  Future<UserApi> createuser () async{
    log("проверОЧКА");
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    final email = prefs.getString('email');
    final username = prefs.getString('username');
    log(email.toString(), name: 'emaillog');
    log(username.toString(), name: 'usernamelog');
    log(id.toString(), name: 'idlog');
    return UserApi(email: email!, id: id!, username: username!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "РЕГИСТРАЦИЯ",
          style: TextStyle(color: Color(0xff246E46)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff246E46)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 64, right: 16, bottom: 16),
            child: TextField(
                controller: _emailcontroller,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "E-mail",
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _usernamecontroller,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "UserName",
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: _passwordcontroller,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
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
                      'Зарегестироваться',
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
                _user = await RemoteService().createUserApi(_emailcontroller.text, _usernamecontroller.text, _passwordcontroller.text);
                _token = await RemoteService().getToken(_usernamecontroller.text, _passwordcontroller.text);
                final prefs = await SharedPreferences.getInstance();
                await  prefs.setBool('login', true);
                await  prefs.setString('refresh', _token.refresh.toString());
                await  prefs.setString('access', _token.access.toString());
                await  prefs.setInt('id', _user.id);
                await  prefs.setString('email', _emailcontroller.text);
                await  prefs.setString('username', _usernamecontroller.text);
                final bool? login = prefs.getBool('login');
                log(login.toString(), name: 'proverkaloga');
                final String? email = prefs.getString('email');
                final String? username = prefs.getString('username');
                final int? idid = prefs.getInt('id');
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(login: login!, BottomNavIndex: 3)),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      )
    );
  }
}



