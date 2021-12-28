// To parse this JSON data, do
//
//     final getLocation = getLocationFromJson(jsonString);

import 'dart:convert';

GetLocation getLocationFromJson(String str) =>
    GetLocation.fromJson(json.decode(str));

String getLocationToJson(GetLocation data) => json.encode(data.toJson());

class GetLocation {
  GetLocation({
    this.version,
    this.key,
    this.type,
    this.rank,
    this.localizedName,
    this.englishName,
    this.primaryPostalCode,
    this.region,
    this.country,
    this.administrativeArea,
    this.timeZone,
    this.geoPosition,
    this.isAlias,
    this.supplementalAdminAreas,
    this.dataSets,
  });

  num? version;
  String? key;
  String? type;
  num? rank;
  String? localizedName;
  String? englishName;
  String? primaryPostalCode;
  Country? region;
  Country? country;
  AdministrativeArea? administrativeArea;
  TimeZone? timeZone;
  GeoPosition? geoPosition;
  bool? isAlias;
  List<SupplementalAdminArea>? supplementalAdminAreas;
  List<String>? dataSets;

  factory GetLocation.fromJson(Map<String, dynamic> json) => GetLocation(
        version: json["Version"],
        key: json["Key"],
        type: json["Type"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
        primaryPostalCode: json["PrimaryPostalCode"],
        region: Country.fromJson(json["Region"]),
        country: Country.fromJson(json["Country"]),
        administrativeArea:
            AdministrativeArea.fromJson(json["AdministrativeArea"]),
        timeZone: TimeZone.fromJson(json["TimeZone"]),
        geoPosition: GeoPosition.fromJson(json["GeoPosition"]),
        isAlias: json["IsAlias"],
        supplementalAdminAreas: List<SupplementalAdminArea>.from(
            json["SupplementalAdminAreas"]
                .map((x) => SupplementalAdminArea.fromJson(x))),
        dataSets: List<String>.from(json["DataSets"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Version": version,
        "Key": key,
        "Type": type,
        "Rank": rank,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
        "PrimaryPostalCode": primaryPostalCode,
        "Region": region!.toJson(),
        "Country": country!.toJson(),
        "AdministrativeArea": administrativeArea!.toJson(),
        "TimeZone": timeZone!.toJson(),
        "GeoPosition": geoPosition!.toJson(),
        "IsAlias": isAlias,
        "SupplementalAdminAreas":
            List<dynamic>.from(supplementalAdminAreas!.map((x) => x.toJson())),
        "DataSets": List<dynamic>.from(dataSets!.map((x) => x)),
      };
}

class AdministrativeArea {
  AdministrativeArea({
    this.id,
    this.localizedName,
    this.englishName,
    this.level,
    this.localizedType,
    this.englishType,
    this.countryId,
  });

  String? id;
  String? localizedName;
  String? englishName;
  num? level;
  String? localizedType;
  String? englishType;
  String? countryId;

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      AdministrativeArea(
        id: json["ID"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
        level: json["Level"],
        localizedType: json["LocalizedType"],
        englishType: json["EnglishType"],
        countryId: json["CountryID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
        "Level": level,
        "LocalizedType": localizedType,
        "EnglishType": englishType,
        "CountryID": countryId,
      };
}

class Country {
  Country({
    this.id,
    this.localizedName,
    this.englishName,
  });

  String? id;
  String? localizedName;
  String? englishName;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["ID"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
      };
}

class GeoPosition {
  GeoPosition({
    this.latitude,
    this.longitude,
    this.elevation,
  });

  num? latitude;
  num? longitude;
  Elevation? elevation;

  factory GeoPosition.fromJson(Map<String, dynamic> json) => GeoPosition(
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
        elevation: Elevation.fromJson(json["Elevation"]),
      );

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
        "Elevation": elevation!.toJson(),
      };
}

class Elevation {
  Elevation({
    this.metric,
    this.imperial,
  });

  Imperial? metric;
  Imperial? imperial;

  factory Elevation.fromJson(Map<String, dynamic> json) => Elevation(
        metric: Imperial.fromJson(json["Metric"]),
        imperial: Imperial.fromJson(json["Imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "Metric": metric!.toJson(),
        "Imperial": imperial!.toJson(),
      };
}

class Imperial {
  Imperial({
    this.value,
    this.unit,
    this.unitType,
  });

  num? value;
  String? unit;
  num? unitType;

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json["Value"],
        unit: json["Unit"],
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
      };
}

class SupplementalAdminArea {
  SupplementalAdminArea({
    this.level,
    this.localizedName,
    this.englishName,
  });

  num? level;
  String? localizedName;
  String? englishName;

  factory SupplementalAdminArea.fromJson(Map<String, dynamic> json) =>
      SupplementalAdminArea(
        level: json["Level"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
      );

  Map<String, dynamic> toJson() => {
        "Level": level,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
      };
}

class TimeZone {
  TimeZone({
    this.code,
    this.name,
    this.gmtOffset,
    this.isDaylightSaving,
    this.nextOffsetChange,
  });

  String? code;
  String? name;
  num? gmtOffset;
  bool? isDaylightSaving;
  DateTime? nextOffsetChange;

  factory TimeZone.fromJson(Map<String, dynamic> json) => TimeZone(
        code: json["Code"],
        name: json["Name"],
        gmtOffset: json["GmtOffset"],
        isDaylightSaving: json["IsDaylightSaving"],
        nextOffsetChange: DateTime.parse(json["NextOffsetChange"]),
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "GmtOffset": gmtOffset,
        "IsDaylightSaving": isDaylightSaving,
        "NextOffsetChange": nextOffsetChange!.toIso8601String(),
      };
}
