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
    this.realFeelTemperature,
    this.realFeelTemperatureShade,
    this.relativeHumidity,
    this.indoorRelativeHumidity,
    this.dewPoint,
    this.wind,
    this.windGust,
    this.uvIndex,
    this.uvIndexText,
    this.visibility,
    this.obstructionsToVisibility,
    this.cloudCover,
    this.ceiling,
    this.pressure,
    this.pressureTendency,
    this.past24HourTemperatureDeparture,
    this.apparentTemperature,
    this.windChillTemperature,
    this.wetBulbTemperature,
    this.precip1Hr,
    this.precipitationSummary,
    this.temperatureSummary,
    this.mobileLink,
    this.link,
  });

  DateTime? localObservationDateTime;
  num? epochTime;
  String? weatherText;
  num? weatherIcon;
  bool? hasPrecipitation;
  dynamic precipitationType;
  bool? isDayTime;
  ApparentTemperature? temperature;
  ApparentTemperature? realFeelTemperature;
  ApparentTemperature? realFeelTemperatureShade;
  num? relativeHumidity;
  num? indoorRelativeHumidity;
  ApparentTemperature? dewPoint;
  Wind? wind;
  WindGust? windGust;
  num? uvIndex;
  String? uvIndexText;
  ApparentTemperature? visibility;
  String? obstructionsToVisibility;
  num? cloudCover;
  ApparentTemperature? ceiling;
  ApparentTemperature? pressure;
  PressureTendency? pressureTendency;
  ApparentTemperature? past24HourTemperatureDeparture;
  ApparentTemperature? apparentTemperature;
  ApparentTemperature? windChillTemperature;
  ApparentTemperature? wetBulbTemperature;
  ApparentTemperature? precip1Hr;
  Map<String, ApparentTemperature>? precipitationSummary;
  TemperatureSummary? temperatureSummary;
  String? mobileLink;
  String? link;

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
        temperature: ApparentTemperature.fromJson(json["Temperature"]),
        realFeelTemperature:
            ApparentTemperature.fromJson(json["RealFeelTemperature"]),
        realFeelTemperatureShade:
            ApparentTemperature.fromJson(json["RealFeelTemperatureShade"]),
        relativeHumidity: json["RelativeHumidity"],
        indoorRelativeHumidity: json["IndoorRelativeHumidity"],
        dewPoint: ApparentTemperature.fromJson(json["DewPoint"]),
        wind: Wind.fromJson(json["Wind"]),
        windGust: WindGust.fromJson(json["WindGust"]),
        uvIndex: json["UVIndex"],
        uvIndexText: json["UVIndexText"],
        visibility: ApparentTemperature.fromJson(json["Visibility"]),
        obstructionsToVisibility: json["ObstructionsToVisibility"],
        cloudCover: json["CloudCover"],
        ceiling: ApparentTemperature.fromJson(json["Ceiling"]),
        pressure: ApparentTemperature.fromJson(json["Pressure"]),
        pressureTendency: PressureTendency.fromJson(json["PressureTendency"]),
        past24HourTemperatureDeparture: ApparentTemperature.fromJson(
            json["Past24HourTemperatureDeparture"]),
        apparentTemperature:
            ApparentTemperature.fromJson(json["ApparentTemperature"]),
        windChillTemperature:
            ApparentTemperature.fromJson(json["WindChillTemperature"]),
        wetBulbTemperature:
            ApparentTemperature.fromJson(json["WetBulbTemperature"]),
        precip1Hr: ApparentTemperature.fromJson(json["Precip1hr"]),
        precipitationSummary: Map.from(json["PrecipitationSummary"]).map(
            (k, v) => MapEntry<String, ApparentTemperature>(
                k, ApparentTemperature.fromJson(v))),
        temperatureSummary:
            TemperatureSummary.fromJson(json["TemperatureSummary"]),
        mobileLink: json["MobileLink"],
        link: json["Link"],
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
        "RealFeelTemperature": realFeelTemperature!.toJson(),
        "RealFeelTemperatureShade": realFeelTemperatureShade!.toJson(),
        "RelativeHumidity": relativeHumidity,
        "IndoorRelativeHumidity": indoorRelativeHumidity,
        "DewPoint": dewPoint!.toJson(),
        "Wind": wind!.toJson(),
        "WindGust": windGust!.toJson(),
        "UVIndex": uvIndex,
        "UVIndexText": uvIndexText,
        "Visibility": visibility!.toJson(),
        "ObstructionsToVisibility": obstructionsToVisibility,
        "CloudCover": cloudCover,
        "Ceiling": ceiling!.toJson(),
        "Pressure": pressure!.toJson(),
        "PressureTendency": pressureTendency!.toJson(),
        "Past24HourTemperatureDeparture":
            past24HourTemperatureDeparture!.toJson(),
        "ApparentTemperature": apparentTemperature!.toJson(),
        "WindChillTemperature": windChillTemperature!.toJson(),
        "WetBulbTemperature": wetBulbTemperature!.toJson(),
        "Precip1hr": precip1Hr!.toJson(),
        "PrecipitationSummary": Map.from(precipitationSummary!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "TemperatureSummary": temperatureSummary!.toJson(),
        "MobileLink": mobileLink,
        "Link": link,
      };
}

class ApparentTemperature {
  ApparentTemperature({
    this.metric,
    this.imperial,
  });

  Imperial? metric;
  Imperial? imperial;

  factory ApparentTemperature.fromJson(Map<String, dynamic> json) =>
      ApparentTemperature(
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
    this.phrase,
  });

  num? value;
  String? unit;
  num? unitType;
  String? phrase;

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json["Value"].toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
        phrase: json["Phrase"] == null ? null : json["Phrase"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
        "Phrase": phrase == null ? null : phrase,
      };
}

class PressureTendency {
  PressureTendency({
    this.localizedText,
    this.code,
  });

  String? localizedText;
  String? code;

  factory PressureTendency.fromJson(Map<String, dynamic> json) =>
      PressureTendency(
        localizedText: json["LocalizedText"],
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "LocalizedText": localizedText,
        "Code": code,
      };
}

class TemperatureSummary {
  TemperatureSummary({
    this.past6HourRange,
    this.past12HourRange,
    this.past24HourRange,
  });

  PastHourRange? past6HourRange;
  PastHourRange? past12HourRange;
  PastHourRange? past24HourRange;

  factory TemperatureSummary.fromJson(Map<String, dynamic> json) =>
      TemperatureSummary(
        past6HourRange: PastHourRange.fromJson(json["Past6HourRange"]),
        past12HourRange: PastHourRange.fromJson(json["Past12HourRange"]),
        past24HourRange: PastHourRange.fromJson(json["Past24HourRange"]),
      );

  Map<String, dynamic> toJson() => {
        "Past6HourRange": past6HourRange!.toJson(),
        "Past12HourRange": past12HourRange!.toJson(),
        "Past24HourRange": past24HourRange!.toJson(),
      };
}

class PastHourRange {
  PastHourRange({
    this.minimum,
    this.maximum,
  });

  ApparentTemperature? minimum;
  ApparentTemperature? maximum;

  factory PastHourRange.fromJson(Map<String, dynamic> json) => PastHourRange(
        minimum: ApparentTemperature.fromJson(json["Minimum"]),
        maximum: ApparentTemperature.fromJson(json["Maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum!.toJson(),
        "Maximum": maximum!.toJson(),
      };
}

class Wind {
  Wind({
    this.direction,
    this.speed,
  });

  Direction? direction;
  ApparentTemperature? speed;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        direction: Direction.fromJson(json["Direction"]),
        speed: ApparentTemperature.fromJson(json["Speed"]),
      );

  Map<String, dynamic> toJson() => {
        "Direction": direction!.toJson(),
        "Speed": speed!.toJson(),
      };
}

class Direction {
  Direction({
    this.degrees,
    this.localized,
    this.english,
  });

  num? degrees;
  String? localized;
  String? english;

  factory Direction.fromJson(Map<String, dynamic> json) => Direction(
        degrees: json["Degrees"],
        localized: json["Localized"],
        english: json["English"],
      );

  Map<String, dynamic> toJson() => {
        "Degrees": degrees,
        "Localized": localized,
        "English": english,
      };
}

class WindGust {
  WindGust({
    this.speed,
  });

  ApparentTemperature? speed;

  factory WindGust.fromJson(Map<String, dynamic> json) => WindGust(
        speed: ApparentTemperature.fromJson(json["Speed"]),
      );

  Map<String, dynamic> toJson() => {
        "Speed": speed!.toJson(),
      };
}
