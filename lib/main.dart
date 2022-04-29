import 'package:diploma/model/UserApi.dart';
import 'package:diploma/pages/favourites.dart';
import 'package:diploma/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/clock.dart';

import 'pages/home.dart';
import 'messenger/messenger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final login = prefs.getBool('login') ?? false;
  final refresh = prefs.getString('refresh') ?? "";
  final access = prefs.getString('access') ?? "";
  final address = prefs.getString('address') ?? "";
  final id = prefs.getInt('id');
  final idadv = prefs.getInt('nowidadv');
  final email = prefs.getString('email') ?? "";
  final username = prefs.getString('username') ?? "";
  runApp(MyApp(login: login,));
}

class MyApp extends StatelessWidget {
  final bool login;
  const MyApp({Key? key, required this.login,}) : super(key: key);

  @override
  MyApp createState() => MyApp(login: login,);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MyHomePage.green,
      ),
      home: MyHomePage(login: login, BottomNavIndex: 0,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int? BottomNavIndex;
  final bool login;

  MyHomePage({Key? key, required this.login,  this.BottomNavIndex}) : super(key: key);

  final iconList = <IconData>[
    Icons.home,
    Icons.favorite,
    Icons.email,
    Icons.person,
  ];

  static MaterialColor green = const MaterialColor(
    0xff83C17F,
    <int, Color>{
      50: Color(0xff83C17F),
      100: Color(0xff83C17F),
      200: Color(0xff83C17F),
      300: Color(0xff83C17F),
      400: Color(0xff83C17F),
      500: Color(0xff83C17F),
      600: Color(0xff83C17F),
      700: Color(0xff83C17F),
      800: Color(0xff83C17F),
      900: Color(0xff83C17F),
    },
  );

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _bottomNavIndex = 0;

  @override
  void initState(){
      _bottomNavIndex = widget.BottomNavIndex?? 0 ;
  }


  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = [
      const Home(),
      Scaffold(
        appBar: AppBar(
          title: const Text(
            "ИЗБРАННОЕ",
            style: TextStyle(color: Color(0xff246E46)),
          ),
          centerTitle: true,
        ),
        body: FV(),
      ),
      MS(),
      Scaffold(
        appBar: AppBar(
          title: const Text(
            "ПРОФИЛЬ",
            style: TextStyle(color: Color(0xff246E46)),
          ),
          centerTitle: true,
        ),
        body: PR(login: widget.login),
      ),
    ]; // to store nested tabs
    final PageStorageBucket bucket = PageStorageBucket();
    return Scaffold(
        body: PageStorage(
        bucket: bucket,
        child: Center(
          child: screens[_bottomNavIndex],
        ),
      ),
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          backgroundColor: const Color(0xff83C17F),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Clock()));
          },
          tooltip: 'Alarm',
          child: const Icon(Icons.watch_later, color: Colors.white,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: widget.iconList,
        splashColor: const Color(0xff246E46),
        inactiveColor: const Color(0xff83C17F),
        activeColor: const Color(0xff246E46),
        activeIndex: _bottomNavIndex,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        gapLocation: GapLocation.center,
        //other params
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


