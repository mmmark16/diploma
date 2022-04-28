import 'dart:developer';

import 'package:diploma/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_adv.dart';
import '../model/UserApi.dart';
import '../services/remote_services.dart';


class UserPage extends StatefulWidget {
  final Function createuser;
  const UserPage({Key? key, required this.createuser, }) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

final TextEditingController _controlleraddress = TextEditingController();

class _UserPageState extends State<UserPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserApi>(
        future: widget.createuser(),
        builder: (context, snapshot){
          log(snapshot.data.toString());
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: (){
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
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
                      'Логин: ${snapshot.requireData.username}',
                      style: TextStyle(fontSize: 24, color: Color(0xff83C17F)),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, left: 24, bottom: 24),
                    child: Text(
                      'E-mail: ${snapshot.requireData.email}',
                      style: TextStyle(fontSize: 24, color: Color(0xff83C17F)),
                    ),
                  ),
                  Divider(),
                  Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextField(
                        controller: _controlleraddress,
                          cursorColor: Color(0xff246E46),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Введите место работы/учебы",
                              filled: false)
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('address', _controlleraddress.text);
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Введеный адрес сохранен'),
                                content: const Text(''),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Сохраннить данные",
                          style: TextStyle(
                              decoration: TextDecoration.underline, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: GestureDetector(
                      child: Container(
                        height: 42,
                        child: const Center(
                            child: Text(
                              'Создать объявление',
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
                        final prefs = await SharedPreferences.getInstance();
                        final String? access = prefs.getString('access');
                        log(access.toString());
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Add_adv()));
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
/*            log("проверОЧКА");
            log(snapshot.requireData.email.toString());
            log(snapshot.requireData.username.toString());
            log(snapshot.requireData.id.toString());*/
            return Center(child: CircularProgressIndicator());
          }
          },
      ),
    );
  }
}
