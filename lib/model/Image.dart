/*
import 'dart:convert';

List<Images> imagesFromJson(str) => str.map<Images>((x) => Images.fromJson(x)).toList();

String imageToJson(List<Images> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Images {
  Images({
    required this.id,
    required this.image,
    required this.announcement,
  });

  int id;
  String image;
  int announcement;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    image: json["image"],
    announcement: json["announcement"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "announcement": announcement,
  };
}*/

import 'dart:convert';

List<Images> imagesFromJson(String str) => List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));

String imagesToJson(List<Images> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Images {
  Images({
    required this.id,
    required this.image,
    required this.announcement,
  });

  int id;
  String image;
  int announcement;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    image: json["image"],
    announcement: json["announcement"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "announcement": announcement,
  };
}
