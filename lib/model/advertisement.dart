import 'dart:convert';

List<Advertisement> advertisementFromJson(str) => str.map<Advertisement>((x) => Advertisement.fromJson(x)).toList();

String advertisementToJson(List<Advertisement> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Advertisement {
  Advertisement({
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
  DateTime pubDate;
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

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
    id: json["id"],
    title: json["title"],
    address: json["address"],
    cost: json["cost"],
    description: json["description"],
    contacts: json["contacts"],
    pubDate: DateTime.parse(json["pub_date"]),
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
    "pub_date": pubDate.toIso8601String(),
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