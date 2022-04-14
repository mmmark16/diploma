import 'package:flutter/material.dart';
class CheckBoxFilters extends StatefulWidget {

  final Function callback;
  final String text;
  final IconData icon;

  CheckBoxFilters({required this.text,  required this.icon, required this.callback,});

  @override
  _CheckBoxFiltersState createState() => _CheckBoxFiltersState();
}

class _CheckBoxFiltersState extends State<CheckBoxFilters> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
          widget.callback();
        },
        child: Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xff246E46))),
              width: 24,
              height: 24,
              child: isChecked ?
              Icon(
                widget.icon,
                size: 20,
                color: Color(0xff246E46),
              )
                  : null,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff246E46),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
