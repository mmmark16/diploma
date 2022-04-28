import 'dart:convert';

Time timeFromJson(String str) => Time.fromJson(json.decode(str));

String timeToJson(Time data) => json.encode(data.toJson());

class Time {
  Time({
    required this.destinationAddresses,
    required this.originAddresses,
    required this.rows,
    required this.status,
  });

  List<String> destinationAddresses;
  List<String> originAddresses;
  List<Rowtime> rows;
  String status;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    destinationAddresses: List<String>.from(json["destination_addresses"].map((x) => x)),
    originAddresses: List<String>.from(json["origin_addresses"].map((x) => x)),
    rows: List<Rowtime>.from(json["rows"].map((x) => Rowtime.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "destination_addresses": List<dynamic>.from(destinationAddresses.map((x) => x)),
    "origin_addresses": List<dynamic>.from(originAddresses.map((x) => x)),
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
    "status": status,
  };
}

class Rowtime {
  Rowtime({
    required this.elements,
  });

  List<Element> elements;

  factory Rowtime.fromJson(Map<String, dynamic> json) => Rowtime(
    elements: List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
  };
}

class Element {
  Element({
    required this.distance,
    required this.duration,
    required this.status,
  });

  Distance distance;
  Duration duration;
  String status;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    distance: Distance.fromJson(json["distance"]),
    duration: Duration.fromJson(json["duration"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "distance": distance.toJson(),
    "duration": duration.toJson(),
    "status": status,
  };
}

class Distance {
  Distance({
    required this.text,
    required this.value,
  });

  String text;
  int value;

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
    text: json["text"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "value": value,
  };
}

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
