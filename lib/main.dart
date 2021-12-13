import 'package:diploma/favourites.dart';
import 'package:diploma/profile.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'alarm_clock.dart';
import 'home.dart';
import 'messenger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MyHomePage.green,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

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
      body: PR(),
    ),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1EFC2),
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
                context, MaterialPageRoute(builder: (_) => Alarm()));
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
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        gapLocation: GapLocation.center,
        //other params
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
