import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Uri uri = Uri.https('samples.openweathermap.org', 'data/2.5/weather', {
      'lat': '44.7075',
      'lon': '18.4919',
      'appid': '27ea5b71f4a79004a0c688852d1bcdc2'
    });
    http.Response response = await http.get(uri);
    try {
      print(response.body);
    } catch (e) {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
//http://api.openweathermap.org/data/2.5/weather?q=srebrenik&appid=27ea5b71f4a79004a0c688852d1bcdc2
