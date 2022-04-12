import 'dart:convert';

List<Advertisement> postFromJson(str) => str.map<Advertisement>((x) => Advertisement.fromJson(x)).toList();

String postToJson(List<Advertisement> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Advertisement {
  Advertisement({
    required this.id,
    required this.title,
    required this.address,
    required this.cost,
    required this.description,
    required this.filters,
    required this.contacts,
    required this.pubDate,
    required this.author,
  });

  int id;
  Filters filters;
  String title;
  String address;
  int cost;
  String description;
  String contacts;
  DateTime pubDate;
  int author;

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
    id: json["id"],
    filters: Filters.fromJson(json["filters"]),
    title: json["title"],
    address: json["address"],
    cost: json["cost"],
    description: json["description"],
    contacts: json["contacts"],
    pubDate: DateTime.parse(json["pub_date"]),
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "filters": filters.toJson(),
    "title": title,
    "address": address,
    "cost": cost,
    "description": description,
    "contacts": contacts,
    "pub_date": pubDate.toIso8601String(),
    "author": author,
  };
}

class Filters {
  Filters({
    required this.id,
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
  });

  int id;
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

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    id: json["id"],
    square: json["square"].toDouble(),
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
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
  };
}