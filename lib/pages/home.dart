import 'dart:developer';
import 'package:diploma/main.dart';
import 'package:diploma/model/Advertisement.dart';
import 'package:diploma/pages/Search.dart';
import 'package:diploma/ui/ads_cards.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Code.dart';
import '../model/Image.dart';
import '../model/Time.dart';
import '../services/remote_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Advertisement? advertisements;
  Advertisement? advertisementsfav;
  Advertisement? advertisementsnotfav;
  Images? images;
  late Map <int, String> imagesToAdv;
  List<String> lol = [];

  late bool newadv;
  var isLoaded = false;
  var login = false;
  late bool wew;


  @override
  void initState() {
    super.initState();
    getnew();
    getLog();
    getData();
  }

  getnew() async {
    final prefs = await SharedPreferences.getInstance();
    newadv = (await prefs.getBool('newadv') ?? false);
    setState(() {
      wew = newadv;
    });
  }
  getLog() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? '';
    log(email.toString(), name: 'proverkaemail');
    log(email.length.toString(), name: 'проверка длинны');
    if (email.length > 0) {
      setState(() {
        login = true;
      });
    }
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? '';

    if(email.length>0){
      log(login.toString(), name:'проверка логина');
      final prefs = await SharedPreferences.getInstance();
      final iduser = prefs.getInt('id');


      advertisementsfav = await RemoteService().getAdvertisementforloginuser(iduser!);
      for (int i = 0; i < advertisementsfav!.results.length; i++) {
        advertisementsfav!.results[i].isFavorite = true;
      }


      advertisementsnotfav = await RemoteService().getAdvertisementforloginuser2(iduser);


      for(int j = 0; j < advertisementsnotfav!.results.length; j++){
        advertisementsfav!.results.add(advertisementsnotfav!.results[j]);
      }

      advertisements = advertisementsfav;

      final address = prefs.getString('address') ?? '';
      log(address.toString(), name: 'проверка адреса пользователя');
      log(address.length.toString(), name: 'проверка длины адреса');
      if(address.length > 0){
        Code code1 = Code();
        Code code2 = Code();
        late Time time1;
        log('проверка', name: 'проверка заходит ли в if');
        for(int p = 0; p < advertisements!.results.length; p++){
          code1 = await RemoteService().getCode(advertisements!.results[p].address);
          code2 = await RemoteService().getCode(address);
          time1 = await RemoteService().getTime(
              code1.suggestions![0].data!.geoLat.toString(),
              code1.suggestions![0].data!.geoLon.toString(),
              code2.suggestions![0].data!.geoLat.toString(),
              code2.suggestions![0].data!.geoLon.toString());

          advertisements!.results[p].time = time1.rows[0].elements[0].duration.value;
          log(advertisements!.results[p].title.toString(), name: 'проверка названия объявления');
          log(advertisements!.results[p].time.toString(), name: 'проверка времени объявления');
        }
        advertisements!.results.sort((a, b) => a.time.compareTo(b.time));

      }

    }
    else {
      advertisements = await RemoteService().getAdvertisement();
    }
    log(wew.toString(), name: 'проверка новое сверху');
    if(wew){
      advertisements!.results = advertisements!.results.reversed.toList();
    }


    images = await RemoteService().getImages();
    bool flag = false;
    for(int i = 0; i < advertisements!.results.length; i++){
      for(int j = 0; j < images!.results.length; j++){
        if(images!.results[j].announcement == advertisements!.results[i].id){
            lol.add(images!.results[j].image);
            flag = true;
        }
      }
      if (!flag){
        lol.add('https://i.ibb.co/Cm2k2xH/error.png');
      } else{
        flag = false;
      }
    }
    if (advertisements != null && images != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Future<String> getString(int id) async {
    images = await RemoteService().getImageforID(id);
    return images!.results[0].image;
  }

  Icon actionIcon = const Icon(Icons.search, color: Color(0xff246E46));
  Icon leadingIcon = const Icon(Icons.trending_down, color: Color(0xff246E46));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: leadingIcon,onPressed:() async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('newadv', !newadv);
          setState(() {
            newadv = !newadv;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(login: login, BottomNavIndex: 0)),
                (Route<dynamic> route) => false,
          );
        } ,),
        title: const Text(
          "ГЛАВНАЯ",
          style: TextStyle(color: Color(0xff246E46)),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: actionIcon,onPressed:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Search()),
            );
          } ,),],
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: advertisements?.results.length,
          itemBuilder: (context, index) {
            log(index.toString(), name: 'проверка индекса');
            return Ads(
              id: advertisements!.results[index].id,
              image: lol[index],
              title: advertisements!.results[index].title,
              cost: advertisements!.results[index].cost.toString(),
              description: advertisements!.results[index].description,
              contacts: advertisements!.results[index].contacts,
              address: advertisements!.results[index].address,
              pubDate: advertisements!.results[index].pubDate,
              author: advertisements!.results[index].author,
              square: advertisements!.results[index].square,
              fridge: advertisements!.results[index].fridge,
              type: advertisements!.results[index].type,
              heating: advertisements!.results[index].heating,
              oven: advertisements!.results[index].oven,
              microwave: advertisements!.results[index].microwave,
              tv: advertisements!.results[index].tv,
              conditioner: advertisements!.results[index].conditioner,
              washMachine: advertisements!.results[index].washMachine,
              router: advertisements!.results[index].router,
              floor: advertisements!.results[index].floor,
              floors: advertisements!.results[index].floors,
              isFavorite: advertisements!.results[index].isFavorite,
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
