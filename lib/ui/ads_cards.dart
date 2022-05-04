import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:diploma/model/Favorites.dart';
import 'package:diploma/ui/ads_base.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/remote_services.dart';

class Ads extends StatefulWidget {
  final String image;
  final int id;
  final String title;
  final String cost;
  final String description;
  final String address;
  final String contacts;
  final String pubDate;
  final int author;
  final double square;
  final bool fridge;
  final int type;
  final int heating;
  final bool microwave;
  final bool washMachine;
  final bool oven;
  final bool conditioner;
  final bool router;
  final bool tv;
  final int floor;
  final int floors;
  late bool isFavorite;


   Ads({
    required this.image,
    required this.title,
    required this.cost,
    required this.description,
    required this.address,
    required this.contacts,
    required this.pubDate,
    required this.author,
    required this.square,
    required this.fridge,
    required this.microwave,
    required this.washMachine,
    required this.oven,
    required this.conditioner,
    required this.router,
    required this.tv,
    required this.floor,
    required this.floors,
    required this.type,
    required this.heating,
    required this.id,
     required this.isFavorite,
  });

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  bool isLiked = false;

  String loadimage(String images) {
    if (images == null) {
      images =
          'https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/g5nq3mokuc8fvn3jpfvu.png';
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        shadowColor: Colors.green,
        clipBehavior: Clip.antiAlias,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.image,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image.asset('assets/error.png'),
                ),
                Positioned(
                    right: 8,
                    top: 8,
                    child: GestureDetector(
                      onTap: () async {
                        if(widget.isFavorite){
                          final prefs = await SharedPreferences.getInstance();
                          final int? iduser = prefs.getInt('id');
                          Favorites fav = await RemoteService().getFavoritedfromfull(widget.id, iduser!);
                          log(fav.results[0].id.toString(), name: 'id избранного');
                          RemoteService().deleteFavorited(fav.results[0].id);
                        }else{
                          final prefs = await SharedPreferences.getInstance();
                          final int? iduser = prefs.getInt('id');
                          RemoteService().createFavorited(iduser!, widget.id);
                        }
                        setState(() {
                          widget.isFavorite = !widget.isFavorite;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 24,
                        color: widget.isFavorite ? Color(0xff246E46) : Colors.white,
                      ),
                    ),

                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 12, right: 16)
                  .copyWith(bottom: 0),
              child: Text(
                'Цена: ${widget.cost} руб. в месяц',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16)
                  .copyWith(bottom: 0),
              child: Text(
                widget.description,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16),
              child: TextButton(
                child: Text('Просмотреть объявление',
                    style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdsBase(
                            title: widget.title,
                            cost: widget.cost,
                            image: widget.image,
                            description: widget.description,
                            contacts: widget.contacts,
                            author: widget.author,
                            pubDate: widget.pubDate,
                            address: widget.address,
                            square: widget.square,
                            fridge: widget.fridge,
                            router: widget.router,
                            microwave: widget.microwave,
                            oven: widget.oven,
                            washMachine: widget.washMachine,
                            tv: widget.tv,
                            conditioner: widget.conditioner,
                            floors: widget.floors,
                            floor: widget.floor)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
