import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:diploma/model/Code.dart';
import 'package:diploma/model/Photo.dart';
import 'package:diploma/model/Profile.dart';
import 'package:diploma/model/Time.dart';
import 'package:diploma/model/Advertisement.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../model/Favorites.dart';
import '../model/Image.dart';
import '../model/Token.dart';
import '../model/UserApi.dart';

class RemoteService {
  Future<Advertisement> getAdvertisement() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/announcement/?format=json');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      return advertisementFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }



  Future<Advertisement> getAdvertisementforloginuser(int id) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/announcement/?format=json&user_id_liked=${id}');
    var responce = await client.get(uri);
    log(responce.statusCode.toString(), name: "проверка кода ошибки при получении данных зарегестрированного пользователя");
    if (responce.statusCode == 200) {
      return advertisementFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }

  Future<Advertisement> getAdvertisementforloginuser2(int id) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/announcement/?format=json&exclude_user_id_liked=${id}');
    var responce = await client.get(uri);
    log(responce.statusCode.toString(), name: "проверка кода ошибки при получении данных зарегестрированного пользователя не избранные");
    if (responce.statusCode == 200) {
      return advertisementFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }

  Future<Advertisement> getFavoritAdvertisement(int id) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/announcement/?user_id_liked=${id}');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {

      return advertisementFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }

  Future<Advertisement> searchAdvertisement(
      int mincost,
      int maxcost,
      String address,
      int minsquare,
      int maxsquare,
      int minfloor,
      int maxfloor,
      int floor,
      int type,
      int heating,
      bool fridge,
      bool microwave,
      bool washMachine,
      bool oven,
      bool conditioner,
      bool router,
      bool TV) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/announcement/?id=&cost__gt=${mincost}&cost__lt=${maxcost}&address=${address}&square__gt=${minsquare}&square__lt=${maxsquare}&floor__gt=${minfloor}&floor__lt=${maxfloor}&floor=${floor}&type=${type}&heating=${heating}&fridge=${fridge}&microwave=${microwave}&washMachine=${washMachine}&oven=${oven}&conditioner=${conditioner}&router=${router}&TV=${TV}');
    log(uri.toString(), name: 'urilog');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      return advertisementFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }

  Future<Advertisement> getAdvertisementforID(int id) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/image/?announcement__id=${id}');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      return advertisementFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }


  Future<UserApi> createUserApi(
      String email, String username, String password) async {
    final response = await http.post(
      Uri.parse(
          'https://estate-alarm.herokuapp.com/auth/users/?format=json'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": email,
        "username": username,
        "password": password
      }),
    );
    print(response.statusCode);
    log('${utf8.decode(response.bodyBytes)}', name: '${response.statusCode}');
    if (response.statusCode == 201) {
      return UserApi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create User.');
    }
  }


  Future<Images> getImageforID(int id) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/announcement/?TV=&address=&conditioner=&cost__gt=&cost__lt=&floor=&floor__gt=&floor__lt=&format=json&fridge=&heating=&id=${id}&microwave=&oven=&router=&square__gt=&square__lt=&type=&washMachine=');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      return imagesFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }



  Future<Time> getTime(String start1, String end1, String start2, String end2) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.distancematrix.ai/maps/api/distancematrix/json?origins=${start1},%20${end1}&destinations=${start2},%20${end2}&key=tJt3JgfL53iqmitEKzSpb9hWPMQUF');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      return timeFromJson(utf8.decode(responce.bodyBytes));

    }
    throw Exception('Ошибка получения данных');
  }

  Future<Images> getImages() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/image/?format=json');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      return imagesFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }
  createImage(
      int announcement,
      String image,
) async {
    final response = await http.post(
      Uri.parse(
          'https://estate-alarm.herokuapp.com/api/image/?image=${image}&announcement=${announcement}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'image': image,
        'announcement': announcement,

      }),
    );
    print(response.statusCode);
    log('${utf8.decode(response.bodyBytes)}', name: '${response.statusCode}');
    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to create Images.');
    }
  }

  Future<Advertisement> createAdvertisement(
      String title,
      String address,
      int cost,
      String description,
      String contacts,
      int author,
      int square,
      int floor,
      int type,
      int floors,
      int heating,
      bool fridge,
      bool microwave,
      bool washMachine,
      bool oven,
      bool conditioner,
      bool router,
      bool TV) async {
    final response = await http.post(
      Uri.parse(
          'https://estate-alarm.herokuapp.com/api/announcement/?format=json'),
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

  void createFavorited(
      int user,
      int announcement,) async {
    final response = await http.post(
      Uri.parse(
          'https://estate-alarm.herokuapp.com/api/favorites/?format=json'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "announcement": announcement,
        "user": user
      }),
    );
    print(response.statusCode);
    log('${utf8.decode(response.bodyBytes)}', name: '${response.statusCode}');
    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to create Favorited.');
    }
  }

  Future<String> sendPhoto(File file) async {
    var request = MultipartRequest('POST', Uri.parse('https://api.imgbb.com/1/upload?key=b57d1dbc7a6c50899f660355beb22069'));
    var _headers = {'Content-Type': 'application/json'};
    request.files.add(await MultipartFile.fromPath('image', file.path));
    request.headers.addAll(_headers);
    var resp = await request.send();
    if (resp.statusCode == 200) {
      Photo json = photoFromJson(utf8.decode((await (resp.stream.bytesToString())).codeUnits));
      log(json.data.url, name: 'проверка полей загруженной картинки');
      return json.data.url;

    }
    throw Exception('Ошибка получения данных');
  }


  Future<Favorites> getFavoritedfromfull(int adv, int id) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/favorites/?announcement=${adv}&format=json&user=${id}');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      return favoritesFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }


  void deleteFavorited(
      int id) async {
    final response = await http.delete(
      Uri.parse(
          'https://estate-alarm.herokuapp.com/api/favorites/${id}/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);
    log('${utf8.decode(response.bodyBytes)}', name: '${response.statusCode}');
    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to create Favorited.');
    }
  }

  Future<Favorites> getFavorited(int id) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://estate-alarm.herokuapp.com/api/favorites/?announcement=&format=json&user=${id}');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      return favoritesFromJson(utf8.decode(responce.bodyBytes));
    }
    throw Exception('Ошибка получения данных');
  }



  Future<Profile> getProfile(String username) async {
    final response = await http.get(
      Uri.parse(
          'https://estate-alarm.herokuapp.com/api/user/?username=${username}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);
    log('${utf8.decode(response.bodyBytes)}', name: '${response.statusCode}');
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get Profile.');
    }
  }

  Future<Profile> getProfileById(int id) async {
    final response = await http.get(
      Uri.parse(
          'https://estate-alarm.herokuapp.com/api/user/?id=${id}&username='),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);
    log('${utf8.decode(response.bodyBytes)}', name: '${response.statusCode}');
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get Profile.');
    }
  }

  Future<Token> getToken(
      String username, String password) async {
    final response = await http.post(
      Uri.parse(
          'https://estate-alarm.herokuapp.com/api/token/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "username": username,
        "password": password
      }),
    );
    print(response.statusCode);
    log('${utf8.decode(response.bodyBytes)}', name: '${response.statusCode}');
    if (response.statusCode == 200) {
      return Token.fromJson(jsonDecode(response.body));
    } else {
      return Token(refresh: '0', access: '0');
    }
  }

  Future<Code> getCode(String address) async {
    final response = await http.post(
      Uri.parse(
        "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Token 95ceaa1b8b2a8ace22ced2dfa062f6aca808ac86",
        "X-Secret": "1c21082c65ecaa40b3ba4cbc751b4a07ed7217eb",
      },
      body: jsonEncode({
        "query": address,
        "count": 1
      }),
    );
    if (response.statusCode == 200) {
      return Code.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get code.');
    }
  }
}
