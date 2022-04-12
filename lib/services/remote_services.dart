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

  Future<Advertisement> sendAdvertisement(
      String title, int id, String imgUrl, int quantity) async {
    final http.Response response = await http.post(
      Uri.parse('https://estate-alarm.herokuapp.com/api/announcement/?format=json') ,
      headers: <String, String> {
        'Content-Type' : 'application/json; charset=UTF-8' ,
      },
      body: jsonEncode(<String, String> {
        'title' : title,
        'id' : id.toString(),
        'imgUrl' : imgUrl,
        'quantity' : quantity.toString()
      }),
    );
    if (response.statusCode == 201) {
      return Advertisement.fromJson(json.decode(response.body));
    } else {
      throw Exception( 'Failed to load album' );
    }
  }
}