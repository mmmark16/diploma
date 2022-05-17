import 'dart:developer';

import 'package:diploma/login.dart';
import 'package:diploma/main.dart';
import 'package:diploma/messenger/helper/constans.dart';
import 'package:diploma/model/Token.dart';
import 'package:diploma/model/UserApi.dart';
import 'package:diploma/pages/UserPage.dart';
import 'package:diploma/services/remote_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'messenger/helper/helpfunction.dart';
import 'messenger/servisec/auth.dart';
import 'messenger/servisec/database.dart';


class REG extends StatefulWidget {
  @override
  State<REG> createState() => _REGState();
}

class _REGState extends State<REG> {

  bool isLoading = false;

  AuthServices authServices = AuthServices();
  DatabaseMethods databaseMethods = DatabaseMethods();

  late UserApi _user;
  late Token _token;
  var token;

  final formkey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  singMeUp()  async {

    setState(() {
      isLoading  = true;
    });

    try{
      await authServices.createUserWithEmailAndPassword(_emailcontroller.text, _passwordcontroller.text).then((val) {
        print('${val?.uid}');
        this.token = val!.uid;
        HelperFunctions.saveUserLoggedInSharedPreference(true);
        HelperFunctions.saveUserNameSharedPreference(_usernamecontroller.text);

        Map<String,String> userInfoMap = {
          'name': _usernamecontroller.text,
          'email': _emailcontroller.text
        };

        databaseMethods.uploadUserInfo(userInfoMap);
        return val.uid;
      });
    } on FirebaseAuthException catch (e){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>  REG()));
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
              title: Text('Ошибка'),
              content: Text('Введите коректные данные \n'
                  'Длина пароля не меньше 12 \n'
                  'Длина имени не меньше 6'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {Navigator.pop(context, 'OK');},
                  child: const Text('OK'),
                ),]

          ));
    }

      _user = await RemoteService().createUserApi(_emailcontroller.text, _usernamecontroller.text, _passwordcontroller.text);
      _token = await RemoteService().getToken(_usernamecontroller.text, _passwordcontroller.text);
      final prefs = await SharedPreferences.getInstance();
      await  prefs.setBool('login', true);
      await  prefs.setString('refresh', _token.refresh.toString());
      await  prefs.setString('access', _token.access.toString());
      await  prefs.setInt('id', _user.id);
      await  prefs.setString('email', _emailcontroller.text);
      await  prefs.setString('username', _usernamecontroller.text);
      bool? login = await prefs.getBool('login');
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

  }
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
      body: isLoading?  Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : ListView(
        children: [
          Form(
            key: formkey,
            child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 64, right: 16, bottom: 16),
                child: TextFormField(
                    validator: (val){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!) ? null : "Введите корректный email";
                    },
                  keyboardType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-mail",
                        filled: true)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (val){
                    return val!.length < 6 ? "Длина логина должна быть больше 6 символов" : null;
                  },
                  controller: _usernamecontroller,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "UserName",
                        filled: true)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                    validator: (val){
                      return val!.length < 12 ? "Длина пароля должна быть больше 6 символов" : null;
                    },
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
                    singMeUp();

                  },
                ),
              ),
            ],
            ),
          ),
        ],
      )
    );
  }
}



