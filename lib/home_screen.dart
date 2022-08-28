import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 25.0),
        children: const [
          WeatherInfo(),
          Divider(
            color: Colors.black,
            height: 50.0,
            thickness: 2.0,
          ),
          WeatherDetails(),
        ],
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key? key,
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
                "Sunday, 28th August",
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
          "Bengaluru",
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w700,
            fontSize: 40.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "Day 25° | Night 23°",
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        Text(
          "24°",
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w700,
            fontSize: 100.0,
          ),
        ),
        Text(
          "Feels like 25°",
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
  const WeatherDetails({Key? key}) : super(key: key);

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
            children: const [
              WeatherDetailCard(
                title: "Humidity",
                icon: Icons.water_drop_outlined,
                accentColor: Colors.blue,
                data: "79%",
              ),
              WeatherDetailCard(
                title: "Visibility",
                icon: Icons.wb_sunny_outlined,
                accentColor: Colors.orange,
                data: "6000 m",
              ),
              WeatherDetailCard(
                title: "Wind",
                icon: Icons.wind_power_outlined,
                accentColor: Colors.purple,
                data: "2.1 km/h",
              ),
              WeatherDetailCard(
                title: "Pressure",
                icon: Icons.settings_outlined,
                accentColor: Colors.pink,
                data: "1009 hPa",
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

class RoundedEdgeDivider extends StatelessWidget {
  final Color color;

  const RoundedEdgeDivider({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      height: 5.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
      ),
    );
  }
}
