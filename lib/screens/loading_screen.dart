import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import '../services/location.dart';


const apiKey = '6caafac12aeba480fb2f7dfa1af915f9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double lognitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$lognitude&appid=$apiKey');

  var weatherData = await networkHelper.getData();
    latitude = location.latitude;
    lognitude = location.lognitude;



    getLocationData();
  }


  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold();
  }
}


    
      // double temp = decodeData['main']['temp'];
      // int condition = decodeData['weather'][0]['id'];
      // String cityName = decodeData['name'];