class Code {
  List<Suggestions>? suggestions;

  Code({this.suggestions});

  Code.fromJson(Map<String, dynamic> json) {
    if (json['suggestions'] != null) {
      suggestions = <Suggestions>[];
      json['suggestions'].forEach((v) {
        suggestions!.add(new Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestions {
  String? value;
  String? unrestrictedValue;
  Data? data;

  Suggestions({this.value, this.unrestrictedValue, this.data});

  Suggestions.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unrestrictedValue = json['unrestricted_value'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unrestricted_value'] = this.unrestrictedValue;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? geoLat;
  String? geoLon;


  Data(
      {
        this.geoLat,
        this.geoLon,});

  Data.fromJson(Map<String, dynamic> json) {
    geoLat = json['geo_lat'];
    geoLon = json['geo_lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['geo_lat'] = this.geoLat;
    data['geo_lon'] = this.geoLon;

    return data;
  }
}