import 'dart:developer';
import 'package:diploma/model/Profile.dart';
import 'package:diploma/pages/ErrorLoginPage.dart';
import 'package:diploma/pages/UserPage.dart';
import 'package:diploma/registration.dart';
import 'package:diploma/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'model/Token.dart';
import 'model/UserApi.dart';

class PR extends StatelessWidget{
  final TextEditingController _controllerusername = TextEditingController();
  final TextEditingController _controllerpassword = TextEditingController();
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);
  final bool login;
  final formKey = GlobalKey<FormState>();
  late BuildContext _context;
  late Profile profile;

  PR({Key? key, required this.login,}) : super(key: key);

  Future<UserApi> createuser () async{
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    final email = prefs.getString('email');
    final username = prefs.getString('username');
    return UserApi(email: email!, id: id!, username: username!);
  }


  @override
  Widget build(BuildContext context) {
    _context = context;
    return  login ? UserPage(createuser: createuser) :  Scaffold(
        body: Center(
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      controller: _controllerusername,
                      decoration: InputDecoration(labelText: "Username"),
                      maxLines: 1,
                      style: _sizeTextBlack,
                    ),
                    width: 350.0,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _controllerpassword,
                      decoration: InputDecoration(labelText: "Пароль"),
                      obscureText: true,
                      maxLines: 1,
                      style: _sizeTextBlack,
                    ),
                    width: 350.0,
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Color(0xff83C17F),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          final refresh = prefs.getString('refresh');
                          Token token = await RemoteService().getToken(_controllerusername.text, _controllerpassword.text);
                          log(token.access.toString(), name: 'проверка аксес токена');
                          log(token.refresh.toString(), name: 'проверка refresh токена');
                          if (token.refresh.length < 2){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ErrorLoginPages()),
                            );
                          } else {
                            profile = await RemoteService().getProfile(_controllerusername.text);
                            int id = profile.results[0].id;
                            String email = profile.results[0].email;
                            String username = profile.results[0].username;
                            log(id.toString(), name: 'iduser');
                            log(email, name: 'emailuser');
                            log(username, name: 'username');
                            await prefs.setInt('id', id);
                            await prefs.setString('email', email);
                            await prefs.setString('username', username);
                            await prefs.setBool('login', true);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(login: true, BottomNavIndex: 3)),
                                  (Route<dynamic> route) => false,
                            );
                          }
                        },
                        child: Text(
                          "ВОЙТИ",
                          style: _sizeTextWhite,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => REG()));
                        },
                        child: const Text(
                          "Еще не зарегестрировались?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Нормальная кнопка добавление !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  /*Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => Add_adv()));
                        },
                        child: const Text(
                          "Создать объявлеине",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),*/
                ],
              )),
        ),
      );
  }

/*  void submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      performLogin();
    }
  }
  void performLogin() {
    hideKeyboard();
    Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(_email, _password)));
  }

  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

class SecondScreen extends StatelessWidget {
  String _email = "";
  String _password = "";
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);

  SecondScreen(String email, String password) {
    _email = email;
    _password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: Center(
          child: Text(
            "Email: $_email, password: $_password",
            style: _sizeTextBlack,
          ),
        ));
  }
}*/
}
