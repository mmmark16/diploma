// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());

class Photo {
  Photo({
    required this.data,
    required this.success,
    required this.status,
  });

  Data data;
  bool success;
  int status;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    data: Data.fromJson(json["data"]),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
    "status": status,
  };
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.urlViewer,
    required this.url,
    required this.displayUrl,
    required this.width,
    required this.height,
    required this.size,
    required this.time,
    required this.expiration,
    required this.deleteUrl,
  });

  String id;
  String title;
  String urlViewer;
  String url;
  String displayUrl;
  String width;
  String height;
  int size;
  String time;
  String expiration;
  String deleteUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    urlViewer: json["url_viewer"],
    url: json["url"],
    displayUrl: json["display_url"],
    width: json["width"],
    height: json["height"],
    size: json["size"],
    time: json["time"],
    expiration: json["expiration"],
    deleteUrl: json["delete_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url_viewer": urlViewer,
    "url": url,
    "display_url": displayUrl,
    "width": width,
    "height": height,
    "size": size,
    "time": time,
    "expiration": expiration,
    "delete_url": deleteUrl,
  };
}
