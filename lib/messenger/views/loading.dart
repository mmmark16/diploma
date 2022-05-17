import 'package:diploma/registration.dart';
import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFFFFFFF),
          ),
          Column(
            children:  [
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: GestureDetector(
                      onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => REG()));},
                      child:Text("загрузка"),)
                ),
              ),
              const Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          color:Color(0xFFA7A7A7) ,
                        ),
                      )
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}