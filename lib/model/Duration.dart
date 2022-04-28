import 'dart:convert';

Duration durationFromJson(String str) => Duration.fromJson(json.decode(str));

String durationToJson(Duration data) => json.encode(data.toJson());

class Duration {
  Duration({
    required this.text,
    required this.value,
  });

  String text;
  int value;

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
    text: json["text"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "value": value,
  };
}

