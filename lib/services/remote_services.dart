import 'dart:convert';
import 'dart:developer';

import 'package:diploma/model/advertisement.dart';
import 'package:diploma/model/advertisement.dart';
import 'package:http/http.dart' as http;

import '../model/Image.dart';

class RemoteService
{
  Future<List<Advertisement>?> getAdvertisement() async{
    var client = http.Client();
    var uri = Uri.parse('https://estate-alarm.herokuapp.com/api/announcement/?format=json');
    var responce = await client.get(uri);
    if (responce.statusCode == 200){
      var json = jsonDecode(utf8.decode(responce.bodyBytes));
      return advertisementFromJson(json);
    }
  }

 Future<List<Images>?> getImage() async{
    var client = http.Client();

    var uri = Uri.parse('https://estate-alarm.herokuapp.com/api/image/?format=json');
    var responce = await client.get(uri);
    if (responce.statusCode == 200){
      var json = jsonDecode(utf8.decode(responce.bodyBytes));
      return imagesFromJson(json);
    }
  }

  Future<Advertisement> createAdvertisement(String title, String address,
  int cost, String description, String contacts, int author, int square,
      int floor, int type, int floors, int heating, bool fridge, bool microwave,
      bool washMachine, bool oven, bool conditioner, bool router, bool TV) async {
    final response = await http.post(
      Uri.parse('https://estate-alarm.herokuapp.com/api/announcement/?format=json'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'title': title,
        'address': address,
        'cost': cost,
        'description': description,
        'contacts': contacts,
        "author": author,
        "square": square,
        "floor": floor,
        "type": type,
        "floors": floors,
        "heating": heating,
        "fridge": fridge,
        "microwave": microwave,
        "washMachine": washMachine,
        "oven": oven,
        "conditioner": conditioner,
        "router": router,
        "TV": TV,
      }),
    );
    print(response.statusCode);
    log('${utf8.decode(response.bodyBytes)}', name: '${response.statusCode}');
    if (response.statusCode == 201) {
      return Advertisement.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Advertisement.');
    }
  }
}