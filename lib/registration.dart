import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class REG extends StatelessWidget {
  String _email = "";
  String _password = "";
  String _passwordcheck = "";
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);
  final formKey = GlobalKey<FormState>();
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      backgroundColor: Color(0xffE1EFC2),
      appBar: AppBar(
        title: Text("РЕГИСТРАЦИЯ", style: TextStyle(
            color: Color(0xff246E46)
        ),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff246E46)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Email",hoverColor: Color(0xff246E46) ,fillColor: Color(0xff246E46)),
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
                    controller: _password,
                    validator: (val){
                      if(val.isEmpty)
                        return 'Empty';
                      return null;
                    }
                    style: _sizeTextBlack,
                  ),
                  width: 350.0,
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Проверка пароля"),
                    obscureText: true,
                    maxLines: 1,
                    validator: (valid) {
                      print(valid);
                      print(_password);
                      return valid!.compareTo(_password) == 0 ? 'Несовпадение паролей' : null;
                    },
                    // onSaved: (val) => _password = val!,
                    style: _sizeTextBlack,
                  ),
                  width: 350.0,
                  padding: const EdgeInsets.only(top: 10.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    height: 50.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Color(0xff83C17F),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: MaterialButton(
                      height: 50.0,
                      minWidth: 300.0,
                      onPressed: submit,
                      child: Text(
                        "ЗАРЕГЕСТРИРОВАТЬТСЯ",
                        style: _sizeTextWhite,
                      ),
                    ),
                  ),
                )
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
          title: Text("ВЫВОД ДАННЫХ"),
        ),
        body: Center(
          child: Text(
            "Email: $_email, password: $_password",
            style: _sizeTextBlack,
          ),
        ));
  }
}
