import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '27ea5b71f4a79004a0c688852d1bcdc2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 44.70306;
  double longitude = 18.49278;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // Location location = Location();
    // await location.getCurrentLocation();

    // latitude = location.latitude;
    // longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.blue,
        ),
      ),
    );
  }
}

//http://api.openweathermap.org/data/2.5/weather?q=srebrenik&appid=27ea5b71f4a79004a0c688852d1bcdc2
