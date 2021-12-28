// // To parse this JSON data, do
// //
// //     final currentWeather = currentWeatherFromJson(jsonString);

// import 'dart:convert';

// CurrentWeather currentWeatherFromJson(String str) =>
//     CurrentWeather.fromJson(json.decode(str));

// String currentWeatherToJson(CurrentWeather data) => json.encode(data.toJson());

// class CurrentWeather {
//   CurrentWeather({
//     this.city,
//     this.cod,
//     this.message,
//     this.cnt,
//     this.list,
//   });

//   City? city;
//   String? cod;
//   num? message;
//   num? cnt;
//   List<ListElement>? list;

//   factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
//         city: City.fromJson(json["city"]) == null
//             ? null
//             : City.fromJson(json["city"]),
//         cod: json["cod"] == null ? null : json["cod"],
//         message: json["message"] == null ? null : json["message"],
//         cnt: json["cnt"] == null ? null : json["cnt"],
//         list: List<ListElement>.from(
//                     json["list"].map((x) => ListElement.fromJson(x))) ==
//                 null
//             ? null
//             : List<ListElement>.from(
//                 json["list"].map((x) => ListElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "city": city!.toJson() == null ? null : city!.toJson(),
//         "cod": cod == null ? null : cod,
//         "message": message == null ? null : message,
//         "cnt": cnt == null ? null : cnt,
//         "list": List<dynamic>.from(list!.map((x) => x.toJson())) == null
//             ? null
//             : List<dynamic>.from(list!.map((x) => x.toJson())),
//       };
// }

// class City {
//   City({
//     this.id,
//     this.name,
//     this.coord,
//     this.country,
//     this.population,
//     this.timezone,
//   });

//   num? id;
//   String? name;
//   Coord? coord;
//   String? country;
//   num? population;
//   num? timezone;

//   factory City.fromJson(Map<String, dynamic> json) => City(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         coord: Coord.fromJson(json["coord"]) == null
//             ? null
//             : Coord.fromJson(json["coord"]),
//         country: json["country"] == null ? null : json["country"],
//         population: json["population"] == null ? null : json["population"],
//         timezone: json["timezone"] == null ? null : json["timezone"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "coord": coord!.toJson() == null ? null : coord!.toJson(),
//         "country": country == null ? null : country,
//         "population": population == null ? null : population,
//         "timezone": timezone == null ? null : timezone,
//       };
// }

// class Coord {
//   Coord({
//     this.lon,
//     this.lat,
//   });

//   num? lon;
//   num? lat;

//   factory Coord.fromJson(Map<String, dynamic> json) => Coord(
//         lon: json["lon"] == null ? null : json["lon"],
//         lat: json["lat"] == null ? null : json["lat"],
//       );

//   Map<String, dynamic> toJson() => {
//         "lon": lon == null ? null : lon,
//         "lat": lat == null ? null : lat,
//       };
// }

// class ListElement {
//   ListElement({
//     this.dt,
//     this.sunrise,
//     this.sunset,
//     this.temp,
//     this.feelsLike,
//     this.pressure,
//     this.humidity,
//     this.weather,
//     this.speed,
//     this.deg,
//     this.gust,
//     this.clouds,
//     this.pop,
//     this.rain,
//   });

//   num? dt;
//   num? sunrise;
//   num? sunset;
//   Temp? temp;
//   FeelsLike? feelsLike;
//   num? pressure;
//   num? humidity;
//   List<Weather>? weather;
//   num? speed;
//   num? deg;
//   num? gust;
//   num? clouds;
//   num? pop;
//   num? rain;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         dt: json["dt"] == null ? null : json["dt"],
//         sunrise: json["sunrise"] == null ? null : json["sunrise"],
//         sunset: json["sunset"] == null ? null : json["sunset"],
//         temp: Temp.fromJson(json["temp"]) == null
//             ? null
//             : Temp.fromJson(json["temp"]),
//         feelsLike: FeelsLike.fromJson(json["feels_like"]) == null
//             ? null
//             : FeelsLike.fromJson(json["feels_like"]),
//         pressure: json["pressure"] == null ? null : json["pressure"],
//         humidity: json["humidity"] == null ? null : json["humidity"],
//         weather: List<Weather>.from(
//                     json["weather"].map((x) => Weather.fromJson(x))) ==
//                 null
//             ? null
//             : List<Weather>.from(
//                 json["weather"].map((x) => Weather.fromJson(x))),
//         speed: json["speed"] == null ? null : json["speed"],
//         deg: json["deg"] == null ? null : json["deg"],
//         gust: json["gust"] == null ? null : json["gust"],
//         clouds: json["clouds"] == null ? null : json["clouds"],
//         pop: json["pop"] == null ? null : json["pop"],
//         rain: json["rain"] == null ? null : json["rain"],
//       );

//   Map<String, dynamic> toJson() => {
//         "dt": dt == null ? null : dt,
//         "sunrise": sunrise == null ? null : sunrise,
//         "sunset": sunset == null ? null : sunset,
//         "temp": temp!.toJson() == null ? null : temp!.toJson(),
//         "feels_like": feelsLike!.toJson() == null ? null : feelsLike!.toJson(),
//         "pressure": pressure == null ? null : pressure,
//         "humidity": humidity == null ? null : humidity,
//         "weather": List<dynamic>.from(weather!.map((x) => x.toJson())) == null
//             ? null
//             : List<dynamic>.from(weather!.map((x) => x.toJson())),
//         "speed": speed == null ? null : speed,
//         "deg": deg == null ? null : deg,
//         "gust": gust == null ? null : gust,
//         "clouds": clouds == null ? null : clouds,
//         "pop": pop == null ? null : pop,
//         "rain": rain == null ? null : rain,
//       };
// }

// class FeelsLike {
//   FeelsLike({
//     this.day,
//     this.night,
//     this.eve,
//     this.morn,
//   });

//   num? day;
//   num? night;
//   num? eve;
//   num? morn;

//   factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
//         day: json["day"] == null ? null : json["day"],
//         night: json["night"] == null ? null : json["night"],
//         eve: json["eve"] == null ? null : json["eve"],
//         morn: json["morn"] == null ? null : json["morn"],
//       );

//   Map<String, dynamic> toJson() => {
//         "day": day == null ? null : day,
//         "night": night == null ? null : night,
//         "eve": eve == null ? null : eve,
//         "morn": morn == null ? null : morn,
//       };
// }

// class Temp {
//   Temp({
//     this.day,
//     this.min,
//     this.max,
//     this.night,
//     this.eve,
//     this.morn,
//   });

//   num? day;
//   num? min;
//   num? max;
//   num? night;
//   num? eve;
//   num? morn;

//   factory Temp.fromJson(Map<String, dynamic> json) => Temp(
//         day: json["day"] == null ? null : json["day"],
//         min: json["min"] == null ? null : json["min"],
//         max: json["max"] == null ? null : json["max"],
//         night: json["night"] == null ? null : json["night"],
//         eve: json["eve"] == null ? null : json["eve"],
//         morn: json["morn"] == null ? null : json["morn"],
//       );

//   Map<String, dynamic> toJson() => {
//         "day": day == null ? null : day,
//         "min": min == null ? null : min,
//         "max": max == null ? null : max,
//         "night": night == null ? null : night,
//         "eve": eve == null ? null : eve,
//         "morn": morn == null ? null : morn,
//       };
// }

// class Weather {
//   Weather({
//     this.id,
//     this.main,
//     this.description,
//     this.icon,
//   });

//   num? id;
//   String? main;
//   String? description;
//   String? icon;

//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         id: json["id"] == null ? null : json["id"],
//         main: json["main"] == null ? null : json["main"],
//         description: json["description"] == null ? null : json["description"],
//         icon: json["icon"] == null ? null : json["icon"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "main": main == null ? null : main,
//         "description": description == null ? null : description,
//         "icon": icon == null ? null : icon,
//       };
// }
