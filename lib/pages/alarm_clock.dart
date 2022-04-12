import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:convert';
import '../bebra.dart';
import '../loadscreen.dart';

class Alarm_clock extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  Alarm_clock({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex())
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex());
  }
}

Future<bigbebra> getData() async {
  var responce = await http.get(Uri.parse('https://zenquotes.io/api/random'));
  print(responce.body);
  print(responce.statusCode);
  if (responce.statusCode == 200) {
    var Json = jsonDecode(responce.body);
    print('+');
    var res = bigbebra.fromJSON(Json[0]);
    print('=');
    return res;
  } else {
    throw "бебра не получена";
  }
}

class Alarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    late String daytext;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff83C17F),
        title: const Text(
          "УСТАНОВКА БУДИЛЬНИКА",
          style: TextStyle(color: Color(0xff246E46)),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bigbebra? bebra = snapshot.data as bigbebra?;
            daytext = bebra!.q;
            return Center(
              child: Column(
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true, onChanged: (date) {
                          print('change $date in time zone ' +
                              date.timeZoneOffset.inHours.toString());
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.ru);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 300),
                        child: Text(
                          'Установить время',
                          style:
                              TextStyle(color: Color(0xff246E46), fontSize: 30),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Center(
                      child: Text(
                        daytext,
                        style: TextStyle(color: Color(0xff246E46), fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return LoadScreen();
        },
      ),
    );
  }
}
