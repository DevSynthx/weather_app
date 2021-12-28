// To parse this JSON data, do
//
//     final hourlyWeatherData = hourlyWeatherDataFromJson(jsonString);

import 'dart:convert';

List<HourlyWeatherData> hourlyWeatherDataFromJson(String str) =>
    List<HourlyWeatherData>.from(
        json.decode(str).map((x) => HourlyWeatherData.fromJson(x)));

String hourlyWeatherDataToJson(List<HourlyWeatherData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HourlyWeatherData {
  HourlyWeatherData({
    this.dateTime,
    this.epochDateTime,
    this.weatherIcon,
    this.iconPhrase,
    this.hasPrecipitation,
    this.isDaylight,
    this.temperature,
    this.precipitationProbability,
    this.mobileLink,
    this.link,
    this.precipitationType,
    this.precipitationIntensity,
  });

  DateTime? dateTime;
  num? epochDateTime;
  num? weatherIcon;
  IconPhrase? iconPhrase;
  bool? hasPrecipitation;
  bool? isDaylight;
  Temperature? temperature;
  num? precipitationProbability;
  String? mobileLink;
  String? link;
  String? precipitationType;
  String? precipitationIntensity;

  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) =>
      HourlyWeatherData(
        dateTime: DateTime.parse(json["DateTime"]),
        epochDateTime: json["EpochDateTime"],
        weatherIcon: json["WeatherIcon"],
        iconPhrase: iconPhraseValues.map[json["IconPhrase"]],
        hasPrecipitation: json["HasPrecipitation"],
        isDaylight: json["IsDaylight"],
        temperature: Temperature.fromJson(json["Temperature"]),
        precipitationProbability: json["PrecipitationProbability"],
        mobileLink: json["MobileLink"],
        link: json["Link"],
        precipitationType: json["PrecipitationType"] == null
            ? null
            : json["PrecipitationType"],
        precipitationIntensity: json["PrecipitationIntensity"] == null
            ? null
            : json["PrecipitationIntensity"],
      );

  Map<String, dynamic> toJson() => {
        "DateTime": dateTime!.toIso8601String(),
        "EpochDateTime": epochDateTime,
        "WeatherIcon": weatherIcon,
        "IconPhrase": iconPhraseValues.reverse[iconPhrase],
        "HasPrecipitation": hasPrecipitation,
        "IsDaylight": isDaylight,
        "Temperature": temperature!.toJson(),
        "PrecipitationProbability": precipitationProbability,
        "MobileLink": mobileLink,
        "Link": link,
        "PrecipitationType":
            precipitationType == null ? null : precipitationType,
        "PrecipitationIntensity":
            precipitationIntensity == null ? null : precipitationIntensity,
      };
}

enum IconPhrase { CLOUDY, MOSTLY_CLOUDY, SHOWERS }

final iconPhraseValues = EnumValues({
  "Cloudy": IconPhrase.CLOUDY,
  "Mostly cloudy": IconPhrase.MOSTLY_CLOUDY,
  "Showers": IconPhrase.SHOWERS
});

class Temperature {
  Temperature({
    this.value,
    this.unit,
    this.unitType,
  });

  num? value;
  Unit? unit;
  num? unitType;

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
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
