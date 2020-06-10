import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData(); //Calls as soon as the app is launched
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather(); //Get location based data using async calls
    Navigator.push(context, MaterialPageRoute(builder: (context) {  //Navigate to main location screen
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce( //Load spinner until location screen is ready to be displayed
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
