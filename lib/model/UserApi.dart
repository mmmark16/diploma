import 'dart:convert';


List<UserApi> userApiFromJson(str) => str.map<UserApi>((x) => UserApi.fromJson(x)).toList();

String userApiToJson(List<UserApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserApi {
  UserApi({
    required this.email,
    required this.id,
    required this.username,
  });

  String email;
  int id;
  String username;

  factory UserApi.fromJson(Map<String, dynamic> json) => UserApi(
    email: json["email"],
    id: json["id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "id": id,
    "username": username,
  };
}