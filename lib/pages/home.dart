import 'dart:developer';

import 'package:diploma/model/Advertisement.dart';
import 'package:diploma/pages/Search.dart';
import 'package:diploma/ui/ads_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  //List<Images>? image;
  late Map <int, String> imagesToAdv;

  var isLoaded = false;
  var login = false;

  @override
  void initState() {
    super.initState();
    getLog();
    getData();
  }


  getLog() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    log(email.toString(), name: 'proverkaemail');
    if (email!.isEmpty) {
      setState(() {
        login = true;
      });
    }
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    if(email!.isNotEmpty){
      log(login.toString(), name:'ghtghtght');
      final prefs = await SharedPreferences.getInstance();
      final iduser = prefs.getInt('id');
      advertisementsfav = await RemoteService().getAdvertisementforloginuser(iduser!);

      advertisementsnotfav = await RemoteService().getAdvertisementforloginuser2(iduser);
      for(int i = 0; i < advertisementsnotfav!.count; i++){
        advertisementsfav!.results.add(advertisementsnotfav!.results[i]);
      }
      //advertisementsfav!.results.addAll(advertisementsnotfav!.results);
      advertisements = advertisementsfav;
    } else {
      advertisements = await RemoteService().getAdvertisement();
    }

    //image = await RemoteService().getImage();
    if (advertisements != null/* && image != null*/) {
      setState(() {
        isLoaded = true;
      });
    }

  }



  Icon actionIcon = const Icon(Icons.search, color: Color(0xff246E46));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            return Ads(
              //image: image![index].image,
              id: advertisements!.results[index].id,
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
