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
  String? postalCode;
  String? country;
  String? countryIsoCode;
  String? federalDistrict;
  String? regionFiasId;
  String? regionKladrId;
  String? regionIsoCode;
  String? regionWithType;
  String? regionType;
  String? regionTypeFull;
  String? region;
  Null? areaFiasId;
  Null? areaKladrId;
  Null? areaWithType;
  Null? areaType;
  Null? areaTypeFull;
  Null? area;
  String? cityFiasId;
  String? cityKladrId;
  String? cityWithType;
  String? cityType;
  String? cityTypeFull;
  String? city;
  Null? cityArea;
  Null? cityDistrictFiasId;
  Null? cityDistrictKladrId;
  String? cityDistrictWithType;
  String? cityDistrictType;
  String? cityDistrictTypeFull;
  String? cityDistrict;
  Null? settlementFiasId;
  Null? settlementKladrId;
  Null? settlementWithType;
  Null? settlementType;
  Null? settlementTypeFull;
  Null? settlement;
  String? streetFiasId;
  String? streetKladrId;
  String? streetWithType;
  String? streetType;
  String? streetTypeFull;
  String? street;
  Null? steadFiasId;
  Null? steadCadnum;
  Null? steadType;
  Null? steadTypeFull;
  Null? stead;
  String? houseFiasId;
  String? houseKladrId;
  Null? houseCadnum;
  String? houseType;
  String? houseTypeFull;
  String? house;
  String? blockType;
  String? blockTypeFull;
  String? block;
  String? entrance;
  String? floor;
  String? flatFiasId;
  String? flatCadnum;
  String? flatType;
  String? flatTypeFull;
  String? flat;
  String? flatArea;
  String? squareMeterPrice;
  String? flatPrice;
  String? postalBox;
  String? fiasId;
  String? fiasCode;
  String? fiasLevel;
  String? fiasActualityState;
  String? kladrId;
  String? geonameId;
  String? capitalMarker;
  String? okato;
  String? oktmo;
  String? taxOffice;
  String? taxOfficeLegal;
  Null? timezone;
  String? geoLat;
  String? geoLon;
  Null? beltwayHit;
  Null? beltwayDistance;
  Null? metro;
  Null? divisions;
  String? qcGeo;
  Null? qcComplete;
  Null? qcHouse;
  Null? historyValues;
  Null? unparsedParts;
  Null? source;
  Null? qc;

  Data(
      {this.postalCode,
        this.country,
        this.countryIsoCode,
        this.federalDistrict,
        this.regionFiasId,
        this.regionKladrId,
        this.regionIsoCode,
        this.regionWithType,
        this.regionType,
        this.regionTypeFull,
        this.region,
        this.areaFiasId,
        this.areaKladrId,
        this.areaWithType,
        this.areaType,
        this.areaTypeFull,
        this.area,
        this.cityFiasId,
        this.cityKladrId,
        this.cityWithType,
        this.cityType,
        this.cityTypeFull,
        this.city,
        this.cityArea,
        this.cityDistrictFiasId,
        this.cityDistrictKladrId,
        this.cityDistrictWithType,
        this.cityDistrictType,
        this.cityDistrictTypeFull,
        this.cityDistrict,
        this.settlementFiasId,
        this.settlementKladrId,
        this.settlementWithType,
        this.settlementType,
        this.settlementTypeFull,
        this.settlement,
        this.streetFiasId,
        this.streetKladrId,
        this.streetWithType,
        this.streetType,
        this.streetTypeFull,
        this.street,
        this.steadFiasId,
        this.steadCadnum,
        this.steadType,
        this.steadTypeFull,
        this.stead,
        this.houseFiasId,
        this.houseKladrId,
        this.houseCadnum,
        this.houseType,
        this.houseTypeFull,
        this.house,
        this.blockType,
        this.blockTypeFull,
        this.block,
        this.entrance,
        this.floor,
        this.flatFiasId,
        this.flatCadnum,
        this.flatType,
        this.flatTypeFull,
        this.flat,
        this.flatArea,
        this.squareMeterPrice,
        this.flatPrice,
        this.postalBox,
        this.fiasId,
        this.fiasCode,
        this.fiasLevel,
        this.fiasActualityState,
        this.kladrId,
        this.geonameId,
        this.capitalMarker,
        this.okato,
        this.oktmo,
        this.taxOffice,
        this.taxOfficeLegal,
        this.timezone,
        this.geoLat,
        this.geoLon,
        this.beltwayHit,
        this.beltwayDistance,
        this.metro,
        this.divisions,
        this.qcGeo,
        this.qcComplete,
        this.qcHouse,
        this.historyValues,
        this.unparsedParts,
        this.source,
        this.qc});

  Data.fromJson(Map<String, dynamic> json) {
    postalCode = json['postal_code'];
    country = json['country'];
    countryIsoCode = json['country_iso_code'];
    federalDistrict = json['federal_district'];
    regionFiasId = json['region_fias_id'];
    regionKladrId = json['region_kladr_id'];
    regionIsoCode = json['region_iso_code'];
    regionWithType = json['region_with_type'];
    regionType = json['region_type'];
    regionTypeFull = json['region_type_full'];
    region = json['region'];
    areaFiasId = json['area_fias_id'];
    areaKladrId = json['area_kladr_id'];
    areaWithType = json['area_with_type'];
    areaType = json['area_type'];
    areaTypeFull = json['area_type_full'];
    area = json['area'];
    cityFiasId = json['city_fias_id'];
    cityKladrId = json['city_kladr_id'];
    cityWithType = json['city_with_type'];
    cityType = json['city_type'];
    cityTypeFull = json['city_type_full'];
    city = json['city'];
    cityArea = json['city_area'];
    cityDistrictFiasId = json['city_district_fias_id'];
    cityDistrictKladrId = json['city_district_kladr_id'];
    cityDistrictWithType = json['city_district_with_type'];
    cityDistrictType = json['city_district_type'];
    cityDistrictTypeFull = json['city_district_type_full'];
    cityDistrict = json['city_district'];
    settlementFiasId = json['settlement_fias_id'];
    settlementKladrId = json['settlement_kladr_id'];
    settlementWithType = json['settlement_with_type'];
    settlementType = json['settlement_type'];
    settlementTypeFull = json['settlement_type_full'];
    settlement = json['settlement'];
    streetFiasId = json['street_fias_id'];
    streetKladrId = json['street_kladr_id'];
    streetWithType = json['street_with_type'];
    streetType = json['street_type'];
    streetTypeFull = json['street_type_full'];
    street = json['street'];
    steadFiasId = json['stead_fias_id'];
    steadCadnum = json['stead_cadnum'];
    steadType = json['stead_type'];
    steadTypeFull = json['stead_type_full'];
    stead = json['stead'];
    houseFiasId = json['house_fias_id'];
    houseKladrId = json['house_kladr_id'];
    houseCadnum = json['house_cadnum'];
    houseType = json['house_type'];
    houseTypeFull = json['house_type_full'];
    house = json['house'];
    blockType = json['block_type'];
    blockTypeFull = json['block_type_full'];
    block = json['block'];
    entrance = json['entrance'];
    floor = json['floor'];
    flatFiasId = json['flat_fias_id'];
    flatCadnum = json['flat_cadnum'];
    flatType = json['flat_type'];
    flatTypeFull = json['flat_type_full'];
    flat = json['flat'];
    flatArea = json['flat_area'];
    squareMeterPrice = json['square_meter_price'];
    flatPrice = json['flat_price'];
    postalBox = json['postal_box'];
    fiasId = json['fias_id'];
    fiasCode = json['fias_code'];
    fiasLevel = json['fias_level'];
    fiasActualityState = json['fias_actuality_state'];
    kladrId = json['kladr_id'];
    geonameId = json['geoname_id'];
    capitalMarker = json['capital_marker'];
    okato = json['okato'];
    oktmo = json['oktmo'];
    taxOffice = json['tax_office'];
    taxOfficeLegal = json['tax_office_legal'];
    timezone = json['timezone'];
    geoLat = json['geo_lat'];
    geoLon = json['geo_lon'];
    beltwayHit = json['beltway_hit'];
    beltwayDistance = json['beltway_distance'];
    metro = json['metro'];
    divisions = json['divisions'];
    qcGeo = json['qc_geo'];
    qcComplete = json['qc_complete'];
    qcHouse = json['qc_house'];
    historyValues = json['history_values'];
    unparsedParts = json['unparsed_parts'];
    source = json['source'];
    qc = json['qc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postal_code'] = this.postalCode;
    data['country'] = this.country;
    data['country_iso_code'] = this.countryIsoCode;
    data['federal_district'] = this.federalDistrict;
    data['region_fias_id'] = this.regionFiasId;
    data['region_kladr_id'] = this.regionKladrId;
    data['region_iso_code'] = this.regionIsoCode;
    data['region_with_type'] = this.regionWithType;
    data['region_type'] = this.regionType;
    data['region_type_full'] = this.regionTypeFull;
    data['region'] = this.region;
    data['area_fias_id'] = this.areaFiasId;
    data['area_kladr_id'] = this.areaKladrId;
    data['area_with_type'] = this.areaWithType;
    data['area_type'] = this.areaType;
    data['area_type_full'] = this.areaTypeFull;
    data['area'] = this.area;
    data['city_fias_id'] = this.cityFiasId;
    data['city_kladr_id'] = this.cityKladrId;
    data['city_with_type'] = this.cityWithType;
    data['city_type'] = this.cityType;
    data['city_type_full'] = this.cityTypeFull;
    data['city'] = this.city;
    data['city_area'] = this.cityArea;
    data['city_district_fias_id'] = this.cityDistrictFiasId;
    data['city_district_kladr_id'] = this.cityDistrictKladrId;
    data['city_district_with_type'] = this.cityDistrictWithType;
    data['city_district_type'] = this.cityDistrictType;
    data['city_district_type_full'] = this.cityDistrictTypeFull;
    data['city_district'] = this.cityDistrict;
    data['settlement_fias_id'] = this.settlementFiasId;
    data['settlement_kladr_id'] = this.settlementKladrId;
    data['settlement_with_type'] = this.settlementWithType;
    data['settlement_type'] = this.settlementType;
    data['settlement_type_full'] = this.settlementTypeFull;
    data['settlement'] = this.settlement;
    data['street_fias_id'] = this.streetFiasId;
    data['street_kladr_id'] = this.streetKladrId;
    data['street_with_type'] = this.streetWithType;
    data['street_type'] = this.streetType;
    data['street_type_full'] = this.streetTypeFull;
    data['street'] = this.street;
    data['stead_fias_id'] = this.steadFiasId;
    data['stead_cadnum'] = this.steadCadnum;
    data['stead_type'] = this.steadType;
    data['stead_type_full'] = this.steadTypeFull;
    data['stead'] = this.stead;
    data['house_fias_id'] = this.houseFiasId;
    data['house_kladr_id'] = this.houseKladrId;
    data['house_cadnum'] = this.houseCadnum;
    data['house_type'] = this.houseType;
    data['house_type_full'] = this.houseTypeFull;
    data['house'] = this.house;
    data['block_type'] = this.blockType;
    data['block_type_full'] = this.blockTypeFull;
    data['block'] = this.block;
    data['entrance'] = this.entrance;
    data['floor'] = this.floor;
    data['flat_fias_id'] = this.flatFiasId;
    data['flat_cadnum'] = this.flatCadnum;
    data['flat_type'] = this.flatType;
    data['flat_type_full'] = this.flatTypeFull;
    data['flat'] = this.flat;
    data['flat_area'] = this.flatArea;
    data['square_meter_price'] = this.squareMeterPrice;
    data['flat_price'] = this.flatPrice;
    data['postal_box'] = this.postalBox;
    data['fias_id'] = this.fiasId;
    data['fias_code'] = this.fiasCode;
    data['fias_level'] = this.fiasLevel;
    data['fias_actuality_state'] = this.fiasActualityState;
    data['kladr_id'] = this.kladrId;
    data['geoname_id'] = this.geonameId;
    data['capital_marker'] = this.capitalMarker;
    data['okato'] = this.okato;
    data['oktmo'] = this.oktmo;
    data['tax_office'] = this.taxOffice;
    data['tax_office_legal'] = this.taxOfficeLegal;
    data['timezone'] = this.timezone;
    data['geo_lat'] = this.geoLat;
    data['geo_lon'] = this.geoLon;
    data['beltway_hit'] = this.beltwayHit;
    data['beltway_distance'] = this.beltwayDistance;
    data['metro'] = this.metro;
    data['divisions'] = this.divisions;
    data['qc_geo'] = this.qcGeo;
    data['qc_complete'] = this.qcComplete;
    data['qc_house'] = this.qcHouse;
    data['history_values'] = this.historyValues;
    data['unparsed_parts'] = this.unparsedParts;
    data['source'] = this.source;
    data['qc'] = this.qc;
    return data;
  }
}