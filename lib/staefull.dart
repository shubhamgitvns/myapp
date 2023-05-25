import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class VSJHomePage extends StatefulWidget {
  Future<void> getUserApi() async {
    final url = Uri.https("swapi.dev", "/api/people/1/");
    try {
      final response = await http.get(url);

      print(response);
      print(response.statusCode);
      final jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      print("name");
      print(jsonResponse["name"]);
      print(jsonResponse["homeworld"]);
      print("films");
      print(jsonResponse["films"]);
      print(jsonResponse["films"][0]);
      print("vehecles");
      print(jsonResponse["vehicles"]);

      Map<String, dynamic> map = jsonResponse;
      print(map.keys);
      for (String key in map.keys) {
        dynamic value = map[key];
      }

      name = map["name"].toString();
      height = map["height"].toString();
      mass = map["mass"].toString();
      hair_color = map["hair_color"].toString();
      skin_color = map["skin_color"].toString();
      eye_color = map["eye_color"].toString();
      birth_year = map["birth_year"].toString();
      gender = map["gender"].toString();
      homeworld = map["homeworld"].toString();
      film1 = map["films"][0].toString();
      film2 = map["films"][1].toString();
      film3 = map["films"][2].toString();
      film4 = map["films"][3].toString();

//       currentmaxtemp = map["list"][0]["main"]["temp_max"].toString();

    } catch (ex) {
      print(ex);
    }
  }

  //*****************************************************************************************
  VSJHomePage({Key? key, required this.title}) : super(key: key);
  String getTitle() {
    return "JSON App";
  }

  String name = "",
      height = "",
      mass = "",
      hair_color = "-",
      skin_color = "",
      eye_color = "",
      birth_year = "",
      gender = "",
      homeworld = "",
      film1 = "",
      film2 = "",
      film3 = "",
      film4 = "";

  final String title;

  @override
  _VSJPageState createState() => _VSJPageState();
}

class _VSJPageState extends State<VSJHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.getTitle()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Name:-" + widget.name),
          Text("Height:-" + widget.height),
          Text("mass:-" + widget.mass),
          Text("Hair-color:-" + widget.hair_color),
          Text("Skin-color:-" + widget.skin_color),
          Text("Eye-color:-" + widget.eye_color),
          Text("Birth-Year:-" + widget.birth_year),
          Text("Gender:-" + widget.gender),
          Text("Homeworld:-" + widget.homeworld),
          Text("Film:-" + widget.film1),
          Text("Film:-" + widget.film2),
          Text("Film:-" + widget.film3),
          Text("Film:-" + widget.film4),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: const Text("Click"),
                  onPressed: () async {
                    await widget.getUserApi();
                    setState(() {});
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

