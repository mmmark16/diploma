// To parse this JSON data, do
//
//     final images = imagesFromJson(jsonString);

import 'dart:convert';

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));

String imagesToJson(Images data) => json.encode(data.toJson());

class Images {
  Images({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.image,
    required this.announcement,
  });

  int id;
  String image;
  int announcement;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
