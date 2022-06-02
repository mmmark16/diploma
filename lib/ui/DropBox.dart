import 'package:flutter/material.dart';
class DropBox extends StatefulWidget {

  final Function callback;
  final String text;

  const DropBox({Key? key, required this.callback, required this.text}) : super(key: key);

  @override
  _DropBoxState createState() => _DropBoxState();
}

class _DropBoxState extends State<DropBox> {
  String boxvalue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
            child: Text(
              widget.text,
              style: TextStyle(color: Color(0xff246E46), fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0, left: 16),
            child: DropdownButton<String>(
              items: const [
                DropdownMenuItem<String>(
                  value: "",
                  child: Text(
                    "Не имеет значения",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "true",
                  child: Text(
                    "Есть",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "false",
                  child: Text(
                    "Отсутствует",
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  boxvalue = value!;
                });
                widget.callback();
              },
              value: boxvalue,
              elevation: 2,
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
              isDense: true,
              iconSize: 40.0,
              iconEnabledColor: Color(0xff246E46),
            ),
          ),
        ],
      ),
    );
  }
}
