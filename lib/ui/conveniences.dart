import 'package:flutter/material.dart';

class Conveniences extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool visible;

  Conveniences({
    required this.text,
    required this.icon,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: Color(0xff246E46),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 24, color: Color(0xff246E46)),
              ),
            ],
          ),
        ),
        Divider(
          height: 20,
          indent: 16,
          endIndent: 16,
          color: Color(0xff246E46),
        ),
      ]),
    );
  }
}
