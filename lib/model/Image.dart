import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.image,
    required this.announcement,
  });

  int id;
  String image;
  int announcement;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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