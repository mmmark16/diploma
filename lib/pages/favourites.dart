import 'package:diploma/ui/ads_cards.dart';
import 'package:flutter/material.dart';

class FV extends StatelessWidget {
  const FV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 372,
      child: Ads(
          image: 'https://estate-alarm.herokuapp.com/media/announcement_19/error.png',
          title: 'тест объявление',
          cost: '100',
          description: 'тест объявление',
          address: 'тест объявление',
          contacts: 'тест объявление',
          pubDate: DateTime(2022, 4, 17, 21, 19),
          author: 1,
          square: 1,
          fridge: true,
          microwave: true,
          washMachine: true,
          oven: true,
          conditioner: true,
          router: true,
          tv: true,
      floors: 1,
      floor: 1,),
    );
  }
}
