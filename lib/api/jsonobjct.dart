import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'jasonobjctmodelclass.dart';

class phpdataget extends StatefulWidget {
  const phpdataget({Key key}) : super(key: key);

  @override
  _phpdatagetState createState() => _phpdatagetState();
}

class _phpdatagetState extends State<phpdataget> {
  var phpdata = "https://thefuturalabs.com/projects/test/jsonobject.php";
  String dataFromServer = "loading..";
  Person person = Person();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("json"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height) / 3,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Image.network(person.pic),
                title: Text(
                  "name : ${person.name}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Age is ${person.age}."),
                trailing: Text("my secret key is ${person.random}"),

              ),
              color: Color(int.parse(person.random)),
            ),
            FlatButton(
              onPressed: () {
                stringData();
              },
              child: Text("Click"),
              color: Colors.amberAccent,
            )
          ],
        ),
      ),
    );
  }

  stringData() async {
    try {
      print("searching");
      http.Response response = await http.get(phpdata);
      print(response.statusCode.toString());
      Map data = jsonDecode(response.body);
      Person person = Person(
          name: data["name"],
          age: data['age'],
          random: data["random"],
          pic: data['pic']);
      setState(() {
        this.person = person;
      });
    } catch (e) {
      print(e.toString());
    }
  }

}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
