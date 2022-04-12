import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'hive.dart';

class REG extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);
  final formKey = GlobalKey<FormState>();
  late BuildContext _context;
  // late Box<User> box;

  Future<Box<User>> openBox() async {
    return await Hive.openBox<User>('testBox');
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
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
      body: FutureBuilder<Box<User>>(
        future: openBox(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, top: 48, right: 24),
              child: Form(
          key: _form,
          child: Column(
              children: [
                TextFormField(
                    decoration: new InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    style: _sizeTextBlack,
                    controller: _email,
                    validator: (val) {
                      if (val!.isEmpty) return 'Пожалуйста введите свой E-mail';
                      if (!val.contains('@')) return 'Это не E-mail';
                      return null;
                    }),
                TextFormField(
                    decoration: new InputDecoration(labelText: "Пароль"),
                    obscureText: true,
                    style: _sizeTextBlack,
                    controller: _pass,
                    validator: (val) {
                      if (val!.isEmpty) return 'Введите пароль';
                      return null;
                    }),
                TextFormField(
                    decoration: new InputDecoration(labelText: "Проверка пароля"),
                    obscureText: true,
                    style: _sizeTextBlack,
                    controller: _confirmPass,
                    validator: (val) {
                      if (val!.isEmpty) return 'Введите пароль';
                      if (val != _pass.text) return 'Пароли не совпадают';
                      return null;
                    }),
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
                      onPressed: (){
                        var person = User(_email.value.text, _confirmPass.value.text);
                        snapshot.data!.add(person);
                        print(snapshot.data!.getAt(0));
                        snapshot.data!.close();
                        },
                      child: Text(
                        "ЗАРЕГЕСТРИРОВАТЬТСЯ",
                        style: _sizeTextWhite,
                      ),
                    ),
                  ),
                )
              ],
          ),
        ),
            ));
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

  void submit() {
    final _form = formKey.currentState;
    if (true) {
      _form!.save();
      performLogin();
    }
  }

  void performLogin() {
    hideKeyboard();
    Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(_email.value.toString(), _confirmPass.value.toString())));
  }

  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

class SecondScreen extends StatelessWidget {
  String _email = "";
  String _confirmPass = "";
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);

  SecondScreen(String email, String password) {
    _email = email;
    _confirmPass = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ВЫВОД ДАННЫХ"),
        ),
        body: Center(
          child: Text(
            "Email: $_email, password: $_confirmPass",
            style: _sizeTextBlack,
          ),
        ));
  }
}
