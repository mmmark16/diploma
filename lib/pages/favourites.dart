import 'dart:developer';

import 'package:diploma/model/Favorites.dart';
import 'package:diploma/model/Image.dart';
import 'package:diploma/ui/ads_cards.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Advertisement.dart';
import '../services/remote_services.dart';

class FV extends StatefulWidget {
  const FV({Key? key}) : super(key: key);

  @override
  State<FV> createState() => _FVState();
}

class _FVState extends State<FV> {
  Favorites? favorites;
  Advertisement? advertisements;
  Images? images;
  var isLoaded = false;
  List<String> lol = [];



  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    advertisements = await RemoteService().getFavoritAdvertisement(id!);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          //reverse: true,
          itemCount: advertisements?.results.length,
          itemBuilder: (context, index) {
            return Ads(
              image: lol[index],
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
              isFavorite: true,
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
