// To parse this JSON data, do
//
//     final favorites = favoritesFromJson(jsonString);

import 'dart:convert';

Favorites favoritesFromJson(String str) => Favorites.fromJson(json.decode(str));

String favoritesToJson(Favorites data) => json.encode(data.toJson());

class Favorites {
  Favorites({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Resultfav> results;

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Resultfav>.from(json["results"].map((x) => Resultfav.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Resultfav {
  Resultfav({
    required this.id,
    required this.user,
    required this.announcement,
  });

  int id;
  int user;
  int announcement;

  factory Resultfav.fromJson(Map<String, dynamic> json) => Resultfav(
    id: json["id"],
    user: json["user"],
    announcement: json["announcement"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "announcement": announcement,
  };
}
