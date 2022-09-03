import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mentro_weather_app/data_services.dart';
import 'package:mentro_weather_app/weather_model.dart';
import 'package:mentro_weather_app/widgets/rounded_edge_divider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataService dataService = DataService();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "EasyWeather",
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w600,
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<Weather>(
        future: dataService.getWeather(),
        builder: (context, snapshot) => snapshot.hasData
            ? ListView(
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 25.0),
                children: [
                  WeatherInfo(weather: snapshot.data!),
                  const Divider(
                    color: Colors.black,
                    height: 50.0,
                    thickness: 2.0,
                  ),
                  WeatherDetails(weather: snapshot.data!),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final Weather weather;

  const WeatherInfo({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 7.0,
                ),
                child: Text(
                  "Today",
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Text(
                DateFormat("EEE, dd MMMM").format(
                    DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000)),
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          weather.name,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w700,
            fontSize: 40.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "Day ${(weather.main.tempMax - 273.15).toInt()}° | Night ${(weather.main.tempMin - 273.15).toInt()}°",
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        Text(
          "${(weather.main.temp - 273.15).toInt()}°",
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w700,
            fontSize: 100.0,
          ),
        ),
        Text(
          "Feels like ${(weather.main.feelsLike - 273.15).toInt()}°",
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

class WeatherDetails extends StatelessWidget {
  final Weather weather;

  const WeatherDetails({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Details",
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              childAspectRatio: 1.5,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
            children: [
              WeatherDetailCard(
                title: "Humidity",
                icon: Icons.water_drop_outlined,
                accentColor: Colors.blue,
                data: "${weather.main.humidity}%",
              ),
              WeatherDetailCard(
                title: "Visibility",
                icon: Icons.wb_sunny_outlined,
                accentColor: Colors.orange,
                data: "${weather.visibility} m",
              ),
              WeatherDetailCard(
                title: "Wind",
                icon: Icons.wind_power_outlined,
                accentColor: Colors.purple,
                data: "${weather.wind.speed} km/h",
              ),
              WeatherDetailCard(
                title: "Pressure",
                icon: Icons.settings_outlined,
                accentColor: Colors.pink,
                data: "${weather.main.pressure} hPa",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherDetailCard extends StatelessWidget {
  final String title;
  final String data;
  final Color accentColor;
  final IconData icon;

  const WeatherDetailCard({
    Key? key,
    required this.title,
    required this.data,
    required this.accentColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 7.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedEdgeDivider(
              color: accentColor,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 20.0,
                  color: accentColor,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  title,
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              data,
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
