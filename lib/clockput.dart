import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class SuperClock extends StatefulWidget {
  const SuperClock({Key? key}) : super(key: key);

  @override
  _SuperClockState createState() => _SuperClockState();
}

class _SuperClockState extends State<SuperClock> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff83C17F),
        title: Text('УСТАНОВКА БУДИЛЬНИКА', style: TextStyle(color: Color(0xff246E46)),),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Оптимальное время',style: TextStyle(color: Color(0xff246E46), fontSize: 24) ),
            ),
            SizedBox(height: 30),
            Row(
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
                          border: InputBorder.none,
                          hintText: '11'
                        ),
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
                            border: InputBorder.none,
                            hintText: '10'
                        ),
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Поставить время',
                  style: TextStyle(color: Color(0xff83C17F), fontSize: 20)
            ),
                onPressed: () {
                  int hour;
                  int minutes;
                  hour = int.parse(hourController.text);
                  minutes = int.parse(minuteController.text);

                  // creating alarm after converting hour
                  // and minute into integer
                  FlutterAlarmClock.createAlarm(hour, minutes);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Список будильников',
                    style: TextStyle(color: Color(0xff83C17F), fontSize: 20),
                ),
                onPressed: () {

                  // show alarm
                  FlutterAlarmClock.showAlarms();
                },
              ),
            ),

            /*Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                  child: const Text(
                    'Create timer',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    int minutes;
                    minutes = int.parse(minuteController.text);

                    // create timer
                    FlutterAlarmClock.createTimer(minutes);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AboutDialog(
                            children: [
                              Center(
                                child: Text("Timer is set",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold)),
                              )
                            ],
                          );
                        });
                  }),
            ),
            ElevatedButton(
              onPressed: () {

                // show timers
                FlutterAlarmClock.showTimers();
              },
              child: Text(
                "Show Timers",
                style: TextStyle(fontSize: 17),
              ),
            )*/
          ])),
    );
  }
}
