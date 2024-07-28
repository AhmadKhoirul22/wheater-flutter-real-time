import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'location_screen.dart';
import 'package:weather/services/weather.dart';



const apiKey = 'df55f7b31d6c4f203e9fb724fd9af49c';
// memakai akunnya slowmo

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
  var weatherData = await WeatherModel().getLocationWeather();
  if (!mounted) return;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LocationScreen(
        locationWeather: weatherData,
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: SpinKitFadingCube(color: Colors.white),
      )
    );
  }
}
