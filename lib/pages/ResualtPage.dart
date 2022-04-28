import 'package:diploma/model/Advertisement.dart';
import 'package:flutter/material.dart';

import '../ui/ads_cards.dart';

class ResualtPage extends StatefulWidget {
  final Advertisement adv;

  const ResualtPage({Key? key, required this.adv}) : super(key: key);

  @override
  _ResualtPageState createState() => _ResualtPageState();
}

class _ResualtPageState extends State<ResualtPage> {
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
      body: ListView.builder(
        itemCount: widget.adv.count,
        itemBuilder: (context, index) {
          return Ads(
            //image: image![index].image,
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
          );
        },
      ),
    );
  }
}