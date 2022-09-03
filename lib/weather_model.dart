import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.main,
    required this.visibility,
    required this.wind,
    required this.dt,
    required this.name,
  });

  final Main main;
  final int visibility;
  final Wind wind;
  final int dt;
  final String name;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        dt: json["dt"],
        name: json["name"] == '' ? 'Unknown City' : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "dt": dt,
        "name": name,
      };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Wind {
  Wind({
    required this.speed,
  });

  final double speed;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
      };
}
