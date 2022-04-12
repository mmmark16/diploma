import 'dart:convert';

import 'package:diploma/model/advertisement.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  Future<List<Advertisement>?> getAdvertisement() async{
    var client = http.Client();

    var uri = Uri.parse('https://estate-alarm.herokuapp.com/api/announcement/?format=json');
    var responce = await client.get(uri);
    if (responce.statusCode == 200){
      var json = jsonDecode(utf8.decode(responce.bodyBytes));
      return postFromJson(json);
    }
  }

  Future<List<Image>?> Image() async{
    var client = http.Client();

    var uri = Uri.parse('https://estate-alarm.herokuapp.com/api/announcement/?format=json');
    var responce = await client.get(uri);
    if (responce.statusCode == 200){
      var json = jsonDecode(utf8.decode(responce.bodyBytes));
      return postFromJson(json);
    }
  }

  /*Future<Advertisement> sendAdvertisement({
      required String title, required String address, required int cost, required String contacts, required int author}) async {
    final http.Response response = await http.post(
      Uri.parse('https://estate-alarm.herokuapp.com/api/announcement/?format=json') ,
      headers: <String, String> {
        'Content-Type' : 'application/json; charset=UTF-8' ,
      },
      body: jsonEncode(<String, String> {
        'title' : title,
        'address' : address,
        'cost' : cost.toString(),
        'contacts' : contacts,
        'author' : author.toString(),
      }),
    );
    if (response.statusCode == 201) {
      return Advertisement.fromJson(json.decode(response.body));
    } else {
      throw Exception( 'Failed to load album' );
    }
  }*/
  Future<Advertisement> createAdvertisement(String title, String address, String cost, String contacts, String author,) async {
    final response = await http.post(
      Uri.parse('https://estate-alarm.herokuapp.com/api/announcement/?format=json'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'address': address,
        'cost': cost,
        'contacts': contacts,
        'author': author,
      }),
    );
    print(response.statusCode);

    if (response.statusCode == 201) {
      return Advertisement.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Advertisement.');
    }
  }
}