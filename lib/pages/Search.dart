import 'dart:developer';

import 'package:diploma/pages/ResualtPage.dart';
import 'package:diploma/services/remote_services.dart';
import 'package:diploma/ui/DropBox.dart';
import 'package:diploma/ui/checkBox_filters.dart';
import 'package:flutter/material.dart';
import '../model/Advertisement.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

final TextEditingController _controllermincost = TextEditingController();
final TextEditingController _controllermaxcost = TextEditingController();
final TextEditingController _controlleraddress = TextEditingController();
final TextEditingController _controllerminsquare = TextEditingController();
final TextEditingController _controllermaxsquare = TextEditingController();
final TextEditingController _controllerminfloor = TextEditingController();
final TextEditingController _controllermaxfloor = TextEditingController();
final TextEditingController _controllerfloor = TextEditingController();

const List<String> namelist = [
  'Холодильник',
  'Микроволновка',
  'Стиральная машина',
  'Печь',
  'Кондиционер',
  'Роутер',
  'Телевизор'
];
const List<IconData> iconlist = [
  Icons.ac_unit,
  Icons.microwave,
  Icons.water_drop,
  Icons.bakery_dining,
  Icons.air,
  Icons.wifi,
  Icons.tv
];

String typeValue = '';
String heatingValue = '';
String fridgeValue = '';
String microwaveValue = '';
String washMachineValue = '';
String ovenValue = '';
String conditionerValue = '';
String routerValue = '';
String TVValue = '';

bool isChecked = false;



class _SearchState extends State<Search> {
  late Advertisement advertisements;

  List<String> checklist = ["", "", "", "", "", "", ""];

  setbool(int index, String value) {
    return () {
      setState(() {
        checklist[index] = value;
        for(int i = 0; i < 7; i++)
        log(checklist[i]);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBar(
            title: const Text(
              'Поиск объявления',
              style: TextStyle(color: Color(0xff246E46)),
            ),
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Color(0xff246E46),
                ),
                tooltip: 'Назад',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Минимальная стоимость',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                controller: _controllermincost,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "мин",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Максимальная стоимость',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                controller: _controllermaxcost,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "макс",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Адрес',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controlleraddress,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Укажите стоимость",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Минимальная площадь',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                controller: _controllerminsquare,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "мин",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Максимальная площадь',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                controller: _controllermaxsquare,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "макс",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Минимальный этаж',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                controller: _controllerminfloor,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "мин",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Максимальный этаж',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                controller: _controllermaxfloor,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "макс",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Этаж',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                controller: _controllerfloor,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "этаж",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
            child: Text(
              'Тип дома',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
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
                  value: "1",
                  child: Text(
                    "Панельный",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "2",
                  child: Text(
                    "Кирпичный",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "3",
                  child: Text(
                    "Монолитный",
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  typeValue = value!;
                });
              },
              value: typeValue,
              elevation: 2,
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
              isDense: true,
              iconSize: 40.0,
              iconEnabledColor: Color(0xff246E46),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
            child: Text(
              'Вид отопления',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
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
                  value: "1",
                  child: Text(
                    "Теплые полы",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "2",
                  child: Text(
                    "Воздушное",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "3",
                  child: Text(
                    "Водяное",
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "4",
                  child: Text(
                    "Паровое",
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  heatingValue = value!;
                });
              },
              value: heatingValue,
              elevation: 2,
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
              isDense: true,
              iconSize: 40.0,
              iconEnabledColor: Color(0xff246E46),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, left: 16),
            child: Text(
              'УДОБСТВА',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
                child: Text(
                  "Холодильник",
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
                      fridgeValue = value!;
                    });
                  },
                  value: fridgeValue,
                  elevation: 2,
                  style: TextStyle(color: Color(0xff246E46), fontSize: 20),
                  isDense: true,
                  iconSize: 40.0,
                  iconEnabledColor: Color(0xff246E46),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
                child: Text(
                  "Микроволновка",
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
                      microwaveValue = value!;
                    });
                  },
                  value: microwaveValue,
                  elevation: 2,
                  style: TextStyle(color: Color(0xff246E46), fontSize: 20),
                  isDense: true,
                  iconSize: 40.0,
                  iconEnabledColor: Color(0xff246E46),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
                child: Text(
                  "Стиральная машина",
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
                      washMachineValue = value!;
                    });
                  },
                  value: washMachineValue,
                  elevation: 2,
                  style: TextStyle(color: Color(0xff246E46), fontSize: 20),
                  isDense: true,
                  iconSize: 40.0,
                  iconEnabledColor: Color(0xff246E46),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
                child: Text(
                  "Печь",
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
                      ovenValue = value!;
                    });
                  },
                  value: ovenValue,
                  elevation: 2,
                  style: TextStyle(color: Color(0xff246E46), fontSize: 20),
                  isDense: true,
                  iconSize: 40.0,
                  iconEnabledColor: Color(0xff246E46),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
                child: Text(
                  "Кондиционер",
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
                      conditionerValue = value!;
                    });
                  },
                  value: conditionerValue,
                  elevation: 2,
                  style: TextStyle(color: Color(0xff246E46), fontSize: 20),
                  isDense: true,
                  iconSize: 40.0,
                  iconEnabledColor: Color(0xff246E46),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
                child: Text(
                  "Роутер",
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
                      routerValue = value!;
                    });
                  },
                  value: routerValue,
                  elevation: 2,
                  style: TextStyle(color: Color(0xff246E46), fontSize: 20),
                  isDense: true,
                  iconSize: 40.0,
                  iconEnabledColor: Color(0xff246E46),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 16, bottom: 16),
                child: Text(
                  "ТВ",
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
                      TVValue = value!;
                    });
                  },
                  value: TVValue,
                  elevation: 2,
                  style: TextStyle(color: Color(0xff246E46), fontSize: 20),
                  isDense: true,
                  iconSize: 40.0,
                  iconEnabledColor: Color(0xff246E46),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
            child: GestureDetector(
              child: Container(
                height: 42,
                child: const Center(
                    child: Text(
                  'Найти',
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
                advertisements = await RemoteService().searchAdvertisement(
                    (_controllermincost.text),
                    (_controllermaxcost.text),
                    _controlleraddress.text,
                    (_controllerminsquare.text),
                    (_controllermaxsquare.text),
                    (_controllerminfloor.text),
                    (_controllermaxfloor.text),
                    (_controllerfloor.text),
                    (typeValue),
                    (heatingValue),
                    fridgeValue,
                    microwaveValue,
                    washMachineValue,
                    ovenValue,
                    conditionerValue,
                    routerValue,
                    TVValue);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResualtPage(adv: advertisements)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
