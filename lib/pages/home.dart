import 'package:diploma/model/advertisement.dart';
import 'package:diploma/ui/ads_cards.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:http/http.dart' as http;

import '../services/remote_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List<Advertisement>? advertisements;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    advertisements = await RemoteService().getAdvertisement();
    if (advertisements != null) {
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
              image: 'assets/3.png',
              title: advertisements![index].title,
              cost: advertisements![index].cost.toString(),
              description: advertisements![index].description,
              contacts: advertisements![index].title,
              address: advertisements![index].title,
              pubDate: advertisements![index].pubDate,
              author: advertisements![index].author,
              square: advertisements![index].filters.square,
              fridge: advertisements![index].filters.fridge,
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
