import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mentro_weather_app/weather_model.dart';
import 'package:permission_handler/permission_handler.dart';

class DataService {
  Future<Weather> getWeather() async {
    var status = await Permission.location.status;

    if (!status.isGranted) {
      await Permission.location.request();
      status = await Permission.location.status;
    }

    if (status.isPermanentlyDenied || status.isDenied) {
      openAppSettings();
    }

    Position position = await Geolocator.getCurrentPosition();

    String uri =
        "https://api.openweathermap.org/data/2.5/weather?lon=${position.longitude}&lat=${position.latitude}&APPID=6adf87802066a3ee22591eb3f8abfe0c";
    final response = await http.get(Uri.parse(uri));
    return Weather.fromJson(json.decode(response.body));
  }
}
