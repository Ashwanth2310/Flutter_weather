import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/weather_model.dart';
import 'package:flutter_application_1/services/weather_service.dart';

class WeatherPage extends StatefulWidget{
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>{

  //api key
  final _weatherService = WeatherService('11020e23f30b24e74f657cecfdcc5a3a');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async{
    //city
    String cityName = await _weatherService.getCurrentCity();

    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    catch(e){
      print(e);
    }
  }
  //animations
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Text(_weather?.cityName ?? "loading city.."),
        
          Text('${_weather?.temperature.round()}*C')
        ]
        
        ),
      )
      
    );
  }
}
