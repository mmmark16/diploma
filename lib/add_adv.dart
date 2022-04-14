import 'package:diploma/services/remote_services.dart';
import 'package:diploma/ui/checkBox_filters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add_adv extends StatefulWidget {

  @override
  _Add_advState createState() => _Add_advState();
}

final TextEditingController _controllertitle = TextEditingController();
final TextEditingController _controlleraddress = TextEditingController();
final TextEditingController _controllercost = TextEditingController();
final TextEditingController _controllerdescription = TextEditingController();
final TextEditingController _controllercontact = TextEditingController();
final TextEditingController _controllerauthor = TextEditingController();
final TextEditingController _controllersquare = TextEditingController();
final TextEditingController _controllerfloor = TextEditingController();
final TextEditingController _controllerfloors = TextEditingController();


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

String typeValue = '1';
String heatingValue = '1';

bool isChecked = false;


class _Add_advState extends State<Add_adv> {

  List<bool> checklist = [false, false, false, false, false, false, false];

  setbool(int index) {
    return () {
      setState(() {
        checklist[index] = !checklist[index];
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
              'Создание объявления',
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
              'Название',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controllertitle,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите название",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Расположение',
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
                    hintText: "Введите адрес",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Цена',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controllercost,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Укажите стоимость",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Об объекте',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controllerdescription,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите описание",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Контакты',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controllercontact,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите свои контакты",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Автор',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                cursorColor: Colors.black,
                controller: _controllerauthor,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите автора 1",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Площадь',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                controller: _controllersquare,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Общая площадь помещения",
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
                    hintText: "Введите этаж помещения",
                    fillColor: Color(0xff83C17F),
                    filled: true)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'О здании',
              style: TextStyle(color: Color(0xff246E46), fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16),
            child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                controller: _controllerfloors,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Введите количество этажей",
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
          ListView.builder(
            itemCount: 7,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                CheckBoxFilters(text: namelist[index], icon: iconlist[index], callback: setbool(index),),
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
            child: GestureDetector(
              child: Container(
                height: 42,
                child: const Center(
                    child: Text(
                      'Сохранить',
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
              onTap: () {
                RemoteService().createAdvertisement(_controllertitle.text, _controlleraddress.text, int.parse(_controllercost.text),
                    _controllerdescription.text, _controllercontact.text, int.parse(_controllerauthor.text),
                    int.parse(_controllersquare.text), int.parse(_controllerfloor.text), int.parse(typeValue), int.parse(_controllerfloors.text),
                    int.parse(heatingValue), checklist[0], checklist[1], checklist[2], checklist[3], checklist[4], checklist[5], checklist[6]);
                //RemoteService().createAdvertisement();
              },
            ),
          )
        ],
      ),
    );
  }
}
