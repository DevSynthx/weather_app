// To parse this JSON data, do
//
//     final currentWeatherData = currentWeatherDataFromJson(jsonString);

import 'dart:convert';

List<CurrentWeatherData> currentWeatherDataFromJson(String str) =>
    List<CurrentWeatherData>.from(
        json.decode(str).map((x) => CurrentWeatherData.fromJson(x)));

String currentWeatherDataToJson(List<CurrentWeatherData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrentWeatherData {
  CurrentWeatherData({
    this.localObservationDateTime,
    this.epochTime,
    this.weatherText,
    this.weatherIcon,
    this.hasPrecipitation,
    this.precipitationType,
    this.isDayTime,
    this.temperature,
  });

  DateTime? localObservationDateTime;
  num? epochTime;
  String? weatherText;
  num? weatherIcon;
  bool? hasPrecipitation;
  dynamic precipitationType;
  bool? isDayTime;
  Temperature? temperature;

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherData(
        localObservationDateTime:
            DateTime.parse(json["LocalObservationDateTime"]),
        epochTime: json["EpochTime"],
        weatherText: json["WeatherText"],
        weatherIcon: json["WeatherIcon"],
        hasPrecipitation: json["HasPrecipitation"],
        precipitationType: json["PrecipitationType"],
        isDayTime: json["IsDayTime"],
        temperature: Temperature.fromJson(json["Temperature"]),
      );

  Map<String, dynamic> toJson() => {
        "LocalObservationDateTime": localObservationDateTime!.toIso8601String(),
        "EpochTime": epochTime,
        "WeatherText": weatherText,
        "WeatherIcon": weatherIcon,
        "HasPrecipitation": hasPrecipitation,
        "PrecipitationType": precipitationType,
        "IsDayTime": isDayTime,
        "Temperature": temperature!.toJson(),
      };
}

class Temperature {
  Temperature({
    this.metric,
    this.imperial,
  });

  Imperial? metric;
  Imperial? imperial;

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
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
