import 'dart:convert';

Advertisement advertisementFromJson(String str) => Advertisement.fromJson(json.decode(str));

String advertisementToJson(Advertisement data) => json.encode(data.toJson());

class Advertisement {
  Advertisement({
    required this.results,
  });

  List<Result> results;

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
    results: json['results'] != null ?  List<Result>.from(json["results"].map((x) => Result.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.address,
    required this.cost,
    required this.description,
    required this.contacts,
    required this.pubDate,
    required this.square,
    required this.floor,
    required this.type,
    required this.floors,
    required this.heating,
    required this.fridge,
    required this.microwave,
    required this.washMachine,
    required this.oven,
    required this.conditioner,
    required this.router,
    required this.tv,
    required this.author,
  });

  int id;
  String title;
  String address;
  int cost;
  String description;
  String contacts;
  String pubDate;
  double square;
  int floor;
  int type;
  int floors;
  int heating;
  bool fridge;
  bool microwave;
  bool washMachine;
  bool oven;
  bool conditioner;
  bool router;
  bool tv;
  int author;
  bool isFavorite = false;
  int time = 0;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    address: json["address"],
    cost: json["cost"],
    description: json["description"],
    contacts: json["contacts"],
    pubDate: json["pub_date"],
    square: json["square"],
    floor: json["floor"],
    type: json["type"],
    floors: json["floors"],
    heating: json["heating"],
    fridge: json["fridge"],
    microwave: json["microwave"],
    washMachine: json["washMachine"],
    oven: json["oven"],
    conditioner: json["conditioner"],
    router: json["router"],
    tv: json["TV"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "address": address,
    "cost": cost,
    "description": description,
    "contacts": contacts,
    "pub_date": pubDate,
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
    "TV": tv,
    "author": author,
  };
}
