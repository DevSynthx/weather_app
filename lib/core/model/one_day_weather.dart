// To parse this JSON data, do
//
//     final oneDayWeather = oneDayWeatherFromJson(jsonString);

import 'dart:convert';

OneDayWeather oneDayWeatherFromJson(String str) =>
    OneDayWeather.fromJson(json.decode(str));

String oneDayWeatherToJson(OneDayWeather data) => json.encode(data.toJson());

class OneDayWeather {
  OneDayWeather({
    this.headline,
    this.dailyForecasts,
  });

  Headline? headline;
  List<DailyForecast>? dailyForecasts;

  factory OneDayWeather.fromJson(Map<String, dynamic> json) => OneDayWeather(
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
    this.sun,
    this.moon,
    this.temperature,
    this.realFeelTemperature,
    this.realFeelTemperatureShade,
    this.hoursOfSun,
    this.degreeDaySummary,
    this.airAndPollen,
    this.day,
    this.night,
    this.sources,
    this.mobileLink,
    this.link,
  });

  DateTime? date;
  num? epochDate;
  Sun? sun;
  Moon? moon;
  RealFeelTemperature? temperature;
  RealFeelTemperature? realFeelTemperature;
  RealFeelTemperature? realFeelTemperatureShade;
  double? hoursOfSun;
  DegreeDaySummary? degreeDaySummary;
  List<AirAndPollen>? airAndPollen;
  Day? day;
  Day? night;
  List<String>? sources;
  String? mobileLink;
  String? link;

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        date: DateTime.parse(json["Date"]),
        epochDate: json["EpochDate"],
        sun: Sun.fromJson(json["Sun"]),
        moon: Moon.fromJson(json["Moon"]),
        temperature: RealFeelTemperature.fromJson(json["Temperature"]),
        realFeelTemperature:
            RealFeelTemperature.fromJson(json["RealFeelTemperature"]),
        realFeelTemperatureShade:
            RealFeelTemperature.fromJson(json["RealFeelTemperatureShade"]),
        hoursOfSun: json["HoursOfSun"].toDouble(),
        degreeDaySummary: DegreeDaySummary.fromJson(json["DegreeDaySummary"]),
        airAndPollen: List<AirAndPollen>.from(
            json["AirAndPollen"].map((x) => AirAndPollen.fromJson(x))),
        day: Day.fromJson(json["Day"]),
        night: Day.fromJson(json["Night"]),
        sources: List<String>.from(json["Sources"].map((x) => x)),
        mobileLink: json["MobileLink"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date!.toIso8601String(),
        "EpochDate": epochDate,
        "Sun": sun!.toJson(),
        "Moon": moon!.toJson(),
        "Temperature": temperature!.toJson(),
        "RealFeelTemperature": realFeelTemperature!.toJson(),
        "RealFeelTemperatureShade": realFeelTemperatureShade!.toJson(),
        "HoursOfSun": hoursOfSun,
        "DegreeDaySummary": degreeDaySummary!.toJson(),
        "AirAndPollen":
            List<dynamic>.from(airAndPollen!.map((x) => x.toJson())),
        "Day": day!.toJson(),
        "Night": night!.toJson(),
        "Sources": List<dynamic>.from(sources!.map((x) => x)),
        "MobileLink": mobileLink,
        "Link": link,
      };
}

class AirAndPollen {
  AirAndPollen({
    this.name,
    this.value,
    this.category,
    this.categoryValue,
    this.type,
  });

  String? name;
  num? value;
  String? category;
  num? categoryValue;
  String? type;

  factory AirAndPollen.fromJson(Map<String, dynamic> json) => AirAndPollen(
        name: json["Name"],
        value: json["Value"],
        category: json["Category"],
        categoryValue: json["CategoryValue"],
        type: json["Type"] == null ? null : json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Value": value,
        "Category": category,
        "CategoryValue": categoryValue,
        "Type": type == null ? null : type,
      };
}

class Day {
  Day({
    this.icon,
    this.iconPhrase,
    this.hasPrecipitation,
    this.shortPhrase,
    this.longPhrase,
    this.precipitationProbability,
    this.thunderstormProbability,
    this.rainProbability,
    this.snowProbability,
    this.iceProbability,
    this.wind,
    this.windGust,
    this.totalLiquid,
    this.rain,
    this.snow,
    this.ice,
    this.hoursOfPrecipitation,
    this.hoursOfRain,
    this.hoursOfSnow,
    this.hoursOfIce,
    this.cloudCover,
    this.evapotranspiration,
    this.solarIrradiance,
  });

  num? icon;
  String? iconPhrase;
  bool? hasPrecipitation;
  String? shortPhrase;
  String? longPhrase;
  num? precipitationProbability;
  num? thunderstormProbability;
  num? rainProbability;
  num? snowProbability;
  num? iceProbability;
  Wind? wind;
  Wind? windGust;
  Evapotranspiration? totalLiquid;
  Evapotranspiration? rain;
  Evapotranspiration? snow;
  Evapotranspiration? ice;
  num? hoursOfPrecipitation;
  num? hoursOfRain;
  num? hoursOfSnow;
  num? hoursOfIce;
  num? cloudCover;
  Evapotranspiration? evapotranspiration;
  Evapotranspiration? solarIrradiance;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        icon: json["Icon"],
        iconPhrase: json["IconPhrase"],
        hasPrecipitation: json["HasPrecipitation"],
        shortPhrase: json["ShortPhrase"],
        longPhrase: json["LongPhrase"],
        precipitationProbability: json["PrecipitationProbability"],
        thunderstormProbability: json["ThunderstormProbability"],
        rainProbability: json["RainProbability"],
        snowProbability: json["SnowProbability"],
        iceProbability: json["IceProbability"],
        wind: Wind.fromJson(json["Wind"]),
        windGust: Wind.fromJson(json["WindGust"]),
        totalLiquid: Evapotranspiration.fromJson(json["TotalLiquid"]),
        rain: Evapotranspiration.fromJson(json["Rain"]),
        snow: Evapotranspiration.fromJson(json["Snow"]),
        ice: Evapotranspiration.fromJson(json["Ice"]),
        hoursOfPrecipitation: json["HoursOfPrecipitation"],
        hoursOfRain: json["HoursOfRain"],
        hoursOfSnow: json["HoursOfSnow"],
        hoursOfIce: json["HoursOfIce"],
        cloudCover: json["CloudCover"],
        evapotranspiration:
            Evapotranspiration.fromJson(json["Evapotranspiration"]),
        solarIrradiance: Evapotranspiration.fromJson(json["SolarIrradiance"]),
      );

  Map<String, dynamic> toJson() => {
        "Icon": icon,
        "IconPhrase": iconPhrase,
        "HasPrecipitation": hasPrecipitation,
        "ShortPhrase": shortPhrase,
        "LongPhrase": longPhrase,
        "PrecipitationProbability": precipitationProbability,
        "ThunderstormProbability": thunderstormProbability,
        "RainProbability": rainProbability,
        "SnowProbability": snowProbability,
        "IceProbability": iceProbability,
        "Wind": wind!.toJson(),
        "WindGust": windGust!.toJson(),
        "TotalLiquid": totalLiquid!.toJson(),
        "Rain": rain!.toJson(),
        "Snow": snow!.toJson(),
        "Ice": ice!.toJson(),
        "HoursOfPrecipitation": hoursOfPrecipitation,
        "HoursOfRain": hoursOfRain,
        "HoursOfSnow": hoursOfSnow,
        "HoursOfIce": hoursOfIce,
        "CloudCover": cloudCover,
        "Evapotranspiration": evapotranspiration!.toJson(),
        "SolarIrradiance": solarIrradiance!.toJson(),
      };
}

class Evapotranspiration {
  Evapotranspiration({
    this.value,
    this.unit,
    this.unitType,
    this.phrase,
  });

  num? value;
  Unit? unit;
  num? unitType;
  String? phrase;

  factory Evapotranspiration.fromJson(Map<String, dynamic> json) =>
      Evapotranspiration(
        value: json["Value"].toDouble(),
        unit: unitValues.map[json["Unit"]],
        unitType: json["UnitType"],
        phrase: json["Phrase"] == null ? null : json["Phrase"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unitValues.reverse[unit],
        "UnitType": unitType,
        "Phrase": phrase == null ? null : phrase,
      };
}

enum Unit { IN, W_M, MI_H, F }

final unitValues = EnumValues(
    {"F": Unit.F, "in": Unit.IN, "mi/h": Unit.MI_H, "W/m²": Unit.W_M});

class Wind {
  Wind({
    this.speed,
    this.direction,
  });

  Evapotranspiration? speed;
  Direction? direction;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: Evapotranspiration.fromJson(json["Speed"]),
        direction: Direction.fromJson(json["Direction"]),
      );

  Map<String, dynamic> toJson() => {
        "Speed": speed!.toJson(),
        "Direction": direction!.toJson(),
      };
}

class Direction {
  Direction({
    this.degrees,
    this.localized,
    this.english,
  });

  int? degrees;
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

class DegreeDaySummary {
  DegreeDaySummary({
    this.heating,
    this.cooling,
  });

  Evapotranspiration? heating;
  Evapotranspiration? cooling;

  factory DegreeDaySummary.fromJson(Map<String, dynamic> json) =>
      DegreeDaySummary(
        heating: Evapotranspiration.fromJson(json["Heating"]),
        cooling: Evapotranspiration.fromJson(json["Cooling"]),
      );

  Map<String, dynamic> toJson() => {
        "Heating": heating!.toJson(),
        "Cooling": cooling!.toJson(),
      };
}

class Moon {
  Moon({
    this.rise,
    this.epochRise,
    this.moonSet,
    this.epochSet,
    this.phase,
    this.age,
  });

  DateTime? rise;
  num? epochRise;
  DateTime? moonSet;
  num? epochSet;
  String? phase;
  num? age;

  factory Moon.fromJson(Map<String, dynamic> json) => Moon(
        rise: DateTime.parse(json["Rise"]),
        epochRise: json["EpochRise"],
        moonSet: DateTime.parse(json["Set"]),
        epochSet: json["EpochSet"],
        phase: json["Phase"],
        age: json["Age"],
      );

  Map<String, dynamic> toJson() => {
        "Rise": rise!.toIso8601String(),
        "EpochRise": epochRise,
        "Set": moonSet!.toIso8601String(),
        "EpochSet": epochSet,
        "Phase": phase,
        "Age": age,
      };
}

class RealFeelTemperature {
  RealFeelTemperature({
    this.minimum,
    this.maximum,
  });

  Evapotranspiration? minimum;
  Evapotranspiration? maximum;

  factory RealFeelTemperature.fromJson(Map<String, dynamic> json) =>
      RealFeelTemperature(
        minimum: Evapotranspiration.fromJson(json["Minimum"]),
        maximum: Evapotranspiration.fromJson(json["Maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum!.toJson(),
        "Maximum": maximum!.toJson(),
      };
}

class Sun {
  Sun({
    this.rise,
    this.epochRise,
    this.sunSet,
    this.epochSet,
  });

  DateTime? rise;
  num? epochRise;
  DateTime? sunSet;
  num? epochSet;

  factory Sun.fromJson(Map<String, dynamic> json) => Sun(
        rise: DateTime.parse(json["Rise"]),
        epochRise: json["EpochRise"],
        sunSet: DateTime.parse(json["Set"]),
        epochSet: json["EpochSet"],
      );

  Map<String, dynamic> toJson() => {
        "Rise": rise!.toIso8601String(),
        "EpochRise": epochRise,
        "Set": sunSet!.toIso8601String(),
        "EpochSet": epochSet,
      };
}

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
