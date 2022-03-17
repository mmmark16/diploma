import 'package:diploma/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PR extends StatelessWidget {
  String _email = "";
  String _password = "";
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);
  final formKey = GlobalKey<FormState>();
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      backgroundColor: Color(0xffE1EFC2),
      body: Center(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    style: _sizeTextBlack,
                    onSaved: (val) => _email = val!,
                    validator: (val) =>
                        !val!.contains("@") ? 'Not a valid email.' : null,
                  ),
                  width: 350.0,
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Пароль"),
                    obscureText: true,
                    maxLines: 1,
                    validator: (val) =>
                        val!.length < 6 ? 'Password too short, min 6 symbols' : null,
                    onSaved: (val) => _password = val!,
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
                      onPressed: submit,
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
              ],
            )),
      ),
    );
  }

  void submit() {
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
}
