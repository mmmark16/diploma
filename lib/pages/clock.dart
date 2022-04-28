import 'dart:developer';
import 'package:diploma/pages/clockput.dart';
import 'package:diploma/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Code.dart';
import '../model/Time.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController home = TextEditingController();
    final TextEditingController work = TextEditingController();
    final TextEditingController meettime = TextEditingController();
    final TextEditingController arrivaltime = TextEditingController();
    final TextEditingController hourController = TextEditingController();
    final TextEditingController minuteController = TextEditingController();

    Future<bool> getvis() async {
      final prefs = await SharedPreferences.getInstance();
      final address = await prefs.getString('address');
      if(address!.isNotEmpty){
        return true;
      } else {
        return false;
      }
    }



    return Scaffold(
      appBar: AppBar(
        title: Text(
          'УСТАНОВКА БУДИЛЬНИКА',
          style: TextStyle(color: Color(0xff246E46)),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 26,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Место жительства',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                controller: home,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите место жительства",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Место работы/учебы',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Visibility(
            visible: true, //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16),
              child: TextField(
                  controller: work,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Введите место работы/учебы",
                      fillColor: Color(0xff83C17F),
                      filled: false)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Время сборов',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                controller: meettime,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите время сборов в минутах",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Время прибытия',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xff83C17F),
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, bottom: 6),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'ч'),
                        controller: hourController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xff83C17F),
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, bottom: 6),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'мин'),
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
            child: GestureDetector(
              child: Container(
                height: 42,
                child: const Center(
                    child: Text(
                  'Установить будильник',
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
                Code code1 = await RemoteService().getCode(home.text);
                Code code2 = await RemoteService().getCode(work.text);
                Time time1 = await RemoteService().getTime(
                  code1.suggestions![0].data!.geoLat.toString(),
                  code1.suggestions![0].data!.geoLon.toString(),
                  code2.suggestions![0].data!.geoLat.toString(),
                  code2.suggestions![0].data!.geoLon.toString(),
                );
                log(time1.rows[0].elements[0].duration.value.toString());
                double fullseconds = (double.parse(hourController.text)*3600 + double.parse(minuteController.text)*60);
                fullseconds = fullseconds - time1.rows[0].elements[0].duration.value - double.parse(meettime.text)*60;
                int clockhour = (fullseconds/3600).toInt();
                int clockmin = ((fullseconds%3600)/60).toInt();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuperClock(hour: clockhour, min: clockmin)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
