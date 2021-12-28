// To parse this JSON data, do
//
//     final dailyWeatherData = dailyWeatherDataFromJson(jsonString);

import 'dart:convert';

DailyWeatherData dailyWeatherDataFromJson(String str) =>
    DailyWeatherData.fromJson(json.decode(str));

String dailyWeatherDataToJson(DailyWeatherData data) =>
    json.encode(data.toJson());

class DailyWeatherData {
  DailyWeatherData({
    this.headline,
    this.dailyForecasts,
  });

  Headline? headline;
  List<DailyForecast>? dailyForecasts;

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) =>
      DailyWeatherData(
        headline: Headline.fromJson(json["Headline"]),
        dailyForecasts: List<DailyForecast>.from(
            json["DailyForecasts"].map((x) => DailyForecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Headline": headline!.toJson(),
        "DailyForecasts":
            List<dynamic>.from(dailyForecasts!.map((x) => x.toJson())),
      };
}

class DailyForecast {
  DailyForecast({
    this.date,
    this.epochDate,
    this.temperature,
    this.day,
    this.night,
    this.sources,
    this.mobileLink,
    this.link,
  });

  DateTime? date;
  num? epochDate;
  Temperature? temperature;
  Day? day;
  Day? night;
  List<String>? sources;
  String? mobileLink;
  String? link;

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        date: DateTime.parse(json["Date"]),
        epochDate: json["EpochDate"],
        temperature: Temperature.fromJson(json["Temperature"]),
        day: Day.fromJson(json["Day"]),
        night: Day.fromJson(json["Night"]),
        sources: List<String>.from(json["Sources"].map((x) => x)),
        mobileLink: json["MobileLink"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date!.toIso8601String(),
        "EpochDate": epochDate,
        "Temperature": temperature!.toJson(),
        "Day": day!.toJson(),
        "Night": night!.toJson(),
        "Sources": List<dynamic>.from(sources!.map((x) => x)),
        "MobileLink": mobileLink,
        "Link": link,
      };
}

class Day {
  Day({
    this.icon,
    this.iconPhrase,
    this.hasPrecipitation,
    this.precipitationType,
    this.precipitationIntensity,
  });

  num? icon;
  String? iconPhrase;
  bool? hasPrecipitation;
  String? precipitationType;
  String? precipitationIntensity;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        icon: json["Icon"],
        iconPhrase: json["IconPhrase"],
        hasPrecipitation: json["HasPrecipitation"],
        precipitationType: json["PrecipitationType"] == null
            ? null
            : json["PrecipitationType"],
        precipitationIntensity: json["PrecipitationIntensity"] == null
            ? null
            : json["PrecipitationIntensity"],
      );

  Map<String, dynamic> toJson() => {
        "Icon": icon,
        "IconPhrase": iconPhrase,
        "HasPrecipitation": hasPrecipitation,
        "PrecipitationType":
            precipitationType == null ? null : precipitationType,
        "PrecipitationIntensity":
            precipitationIntensity == null ? null : precipitationIntensity,
      };
}

class Temperature {
  Temperature({
    this.minimum,
    this.maximum,
  });

  Imum? minimum;
  Imum? maximum;

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        minimum: Imum.fromJson(json["Minimum"]),
        maximum: Imum.fromJson(json["Maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum!.toJson(),
        "Maximum": maximum!.toJson(),
      };
}

class Imum {
  Imum({
    this.value,
    this.unit,
    this.unitType,
  });

  num? value;
  Unit? unit;
  num? unitType;

  factory Imum.fromJson(Map<String, dynamic> json) => Imum(
        value: json["Value"],
        unit: unitValues.map[json["Unit"]],
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unitValues.reverse[unit],
        "UnitType": unitType,
      };
}

enum Unit { F }

final unitValues = EnumValues({"F": Unit.F});

class Headline {
  Headline({
    this.effectiveDate,
    this.effectiveEpochDate,
    this.severity,
    this.text,
    this.category,
    this.endDate,
    this.endEpochDate,
    this.mobileLink,
    this.link,
  });

  DateTime? effectiveDate;
  num? effectiveEpochDate;
  num? severity;
  String? text;
  String? category;
  DateTime? endDate;
  num? endEpochDate;
  String? mobileLink;
  String? link;

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        effectiveDate: DateTime.parse(json["EffectiveDate"]),
        effectiveEpochDate: json["EffectiveEpochDate"],
        severity: json["Severity"],
        text: json["Text"],
        category: json["Category"],
        endDate: DateTime.parse(json["EndDate"]),
        endEpochDate: json["EndEpochDate"],
        mobileLink: json["MobileLink"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "EffectiveDate": effectiveDate!.toIso8601String(),
        "EffectiveEpochDate": effectiveEpochDate,
        "Severity": severity,
        "Text": text,
        "Category": category,
        "EndDate": endDate!.toIso8601String(),
        "EndEpochDate": endEpochDate,
        "MobileLink": mobileLink,
        "Link": link,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
