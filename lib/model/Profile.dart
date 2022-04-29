import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    required this.email,
    required this.username,
  });

  int id;
  String email;
  String username;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    email: json["email"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "username": username,
  };
}
