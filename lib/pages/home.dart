import 'package:diploma/model/advertisement.dart';
import 'package:diploma/ui/ads_cards.dart';
import 'package:flutter/material.dart';

import '../model/Image.dart';
import '../services/remote_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List<Advertisement>? advertisements;
  List<Images>? image;
  late Map <int, String> imagesToAdv;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }



  getData() async {
    image = await RemoteService().getImage();
    advertisements = await RemoteService().getAdvertisement();
    if (advertisements != null && image != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ГЛАВНАЯ",
          style: TextStyle(color: Color(0xff246E46)),
        ),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: advertisements?.length,
          itemBuilder: (context, index) {
            return Ads(
              image: image![index].image,
              title: advertisements![index].title,
              cost: advertisements![index].cost.toString(),
              description: advertisements![index].description,
              contacts: advertisements![index].title,
              address: advertisements![index].title,
              pubDate: advertisements![index].pubDate,
              author: advertisements![index].author,
              square: advertisements![index].square,
              fridge: advertisements![index].fridge,
              oven: advertisements![index].oven,
              microwave: advertisements![index].microwave,
              tv: advertisements![index].tv,
              conditioner: advertisements![index].conditioner,
              washMachine: advertisements![index].washMachine,
              router: advertisements![index].router,
              floor: advertisements![index].floor,
              floors: advertisements![index].floors,
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
