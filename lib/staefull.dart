import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class VSJHomePage extends StatefulWidget {
  //http://openweathermap.org/img/w/10d.png
  bool weatherfound = true;
  String currenticon = "";
  String result = "";

  //*****************************************************************************************
  final String vsjurl =
      "https://3.bp.blogspot.com/-py5FbTZgvjo/YDi1bsQq16I/AAAAAAAACB0/BxejbJBcHA4AVfkB33WYC3YlVmxElM7BwCK4BGAYYCw/s1600/Varanasi%2BSoftware%2BJunction%2BPhone%2BLogo.png";
  String currenturl =
      "https://3.bp.blogspot.com/-py5FbTZgvjo/YDi1bsQq16I/AAAAAAAACB0/BxejbJBcHA4AVfkB33WYC3YlVmxElM7BwCK4BGAYYCw/s1600/Varanasi%2BSoftware%2BJunction%2BPhone%2BLogo.png";


  Future<bool> getWeather(String cityname) async {
    String apikey = "829aa577391b1c7045d0d3d6c7e35002";
    final url = Uri.https("api.openweathermap.org", "/data/2.5/forecast",
        {'q': cityname, 'appid': apikey, 'units': 'metric'});

    try {
      final response = await http.get(url);
      print(response);
      print(response.statusCode);
      final jsonResponse = convert.jsonDecode(response.body);
     // print(jsonResponse);
      print(jsonResponse.runtimeType);
      Map<String, dynamic> map = jsonResponse;
      print(map.keys);
      for (String key in map.keys) {
        dynamic value = map[key];
      //  print(key + " = " + value.toString());
      }
     // print("icon" + map["list"][0]["weather"][0]["icon"].toString());
      currenticon = map["list"][0]["weather"][0]["icon"].toString();
      currentcitytemp = map["list"][0]["main"]["temp"].toString();
      currentmaxtemp = map["list"][0]["main"]["temp_max"].toString();
      currentmintemp = map["list"][0]["main"]["temp_min"].toString();
      description = map["list"][0]["weather"][0]["description"].toString();
      weatherfound = true;
      result="Found the city name";

      return true;
    } catch (ex) {
      print(ex);
      weatherfound = false;
      currentcitytemp = "-";
      currentmaxtemp = "-";
      currentmintemp = "-";
      description = "-";
      result="Error";
      return false;
    }
  }

  //*****************************************************************************************
  VSJHomePage({Key? key, required this.title}) : super(key: key);

  final TextEditingController _controller =
  TextEditingController(text: 'Varanasi');


  String cityname = "";
  String currentcitytemp = "-";
  String currentmaxtemp = "-";
  String currentmintemp = "-";
  String description = "-";
  MainAxisAlignment mainaxisalignment = MainAxisAlignment.start;
  final String title;
  @override
  _VSJPageState createState() => _VSJPageState();
}

class _VSJPageState extends State<VSJHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather-App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text("City Name: "),
              Expanded(
                  flex: 2,
                  child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the city name',// this work like a placeholder
                      ),
                      onChanged: (text) {
                        widget.cityname = text;
                      })),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text("Get Weather"),
                      onPressed: () async {
                        await widget.getWeather(widget.cityname);
                        setState(() {});
                      },
                    ),
                  )),
            ]),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Current Temp"),
                          Text(widget.currentcitytemp),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Max Temp"),
                          Text(widget.currentmaxtemp),
                        ], //Children
                      ), //Column
                    ), //Padding
                  ), //Expanded
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Min Temp"),
                          Text(widget.currentmintemp),
                        ], //Children
                      ), //Column
                    ), //Padding
                  ), //Expanded
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Description"),
                          Text(widget.description),
                        ], //Children
                      ), //Column
                    ), //Padding
                  ), //Expanded

                ] //
                ),
              )),
          
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Result"),

                      Text(widget.result),
                    ], //Children
                  ), //Column
                ), //Padding
              ), //Expa
            ],
          )

        ],
      ),
    );
  }
}
