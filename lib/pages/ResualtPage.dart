import 'package:diploma/model/Advertisement.dart';
import 'package:flutter/material.dart';

import '../model/Image.dart';
import '../services/remote_services.dart';
import '../ui/ads_cards.dart';

class ResualtPage extends StatefulWidget {
  final Advertisement adv;

  const ResualtPage({Key? key, required this.adv}) : super(key: key);

  @override
  _ResualtPageState createState() => _ResualtPageState();
}

class _ResualtPageState extends State<ResualtPage> {
  Images? images;
  var isLoaded = false;
  List<String> lol = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    images = await RemoteService().getImages();
    bool flag = false;
    for(int i = 0; i < widget.adv.results.length; i++){
      for(int j = 0; j < images!.results.length; j++){
        if(images!.results[j].announcement == widget.adv.results[i].id){
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
    if (images != null) {
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
          itemCount: widget.adv.results.length,
          itemBuilder: (context, index) {
            return Ads(
              image: lol[index],
              id: widget.adv.results[index].id,
              title: widget.adv.results[index].title,
              cost: widget.adv.results[index].cost.toString(),
              description: widget.adv.results[index].description,
              contacts: widget.adv.results[index].contacts,
              address: widget.adv.results[index].address,
              pubDate: widget.adv.results[index].pubDate,
              author: widget.adv.results[index].author,
              square: widget.adv.results[index].square,
              fridge: widget.adv.results[index].fridge,
              type: widget.adv.results[index].type,
              heating: widget.adv.results[index].heating,
              oven: widget.adv.results[index].oven,
              microwave: widget.adv.results[index].microwave,
              tv: widget.adv.results[index].tv,
              conditioner: widget.adv.results[index].conditioner,
              washMachine: widget.adv.results[index].washMachine,
              router: widget.adv.results[index].router,
              floor: widget.adv.results[index].floor,
              floors: widget.adv.results[index].floors,
              isFavorite: widget.adv.results[index].isFavorite,
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
