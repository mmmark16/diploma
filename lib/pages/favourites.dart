import 'package:flutter/material.dart';
import 'dart:math';

Widget generateContainer(Color color) {
  return Container(
    width: 10,
    height: 10,
    color: color,
  );
}

class FV extends StatefulWidget {
  const FV({Key? key}) : super(key: key);



  @override
  State<FV> createState() => _FVState();
}

class _FVState extends State<FV> {
  var rn = Random();
  var cvet = [
    Colors.orange,
    Colors.deepPurple,
    Colors.blue,
    Colors.green,
    Colors.lime,
    Colors.teal,
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.amber,
    Colors.cyanAccent,
    Colors.lightGreenAccent,
    Colors.blueGrey,
    Colors.brown,
  ];

  Color myColor = Colors.amber;
  void _incrementCounter() {
    setState(() {
      myColor = cvet[rn.nextInt(cvet.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    var matrix = List.generate(10,
            (index) => List.generate(20, (index) => generateContainer(cvet[rn.nextInt(cvet.length)])));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 380,
                  height: 700,
                  child: GridView.count(
                    crossAxisCount: 10,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    children: [...matrix.expand((el) => el).toList()],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.blue,
        onPressed: _incrementCounter,
        tooltip: 'Epilepsy',
        child: const Icon(Icons.attach_money),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
