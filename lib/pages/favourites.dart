import 'dart:developer';

import 'package:diploma/model/Favorites.dart';
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
  List<Result> res = [];
  var isLoaded = false;



  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    //favorites = await RemoteService().getFavorited(id!);
    //log(favorites!.results[0].announcement.toString());
    advertisements = await RemoteService().getFavoritAdvertisement(id!);
    /*for(int i = 0; i< favorites!.count; i++){
      for (int j =0; j<advertisements!.count; j++){
        if (favorites!.results[i].announcement == advertisements!.results[j].id){
          res.add(advertisements!.results[j]);
        }
      }
    }*/
    //log(res.toString());
    //image = await RemoteService().getImage();
    if (advertisements != null/* && image != null*/) {
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
          itemCount: advertisements?.count,
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
