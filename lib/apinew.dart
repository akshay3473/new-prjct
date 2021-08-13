import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class apinw extends StatefulWidget {
  const apinw({Key key}) : super(key: key);

  @override
  _apinwState createState() => _apinwState();
}

class _apinwState extends State<apinw> {

  var url="https://thefuturalabs.com/projects/test/stringvalue.php";
  String serverdata ="loading...";


  @override
  Widget build(BuildContext context) {
    data();
    return Scaffold(
      appBar: AppBar(),
      body:Container(
        height: 400,
          width: 400,
          child: Text(serverdata),
      )
    );
  }
  data()async{
  var response = await http.get(url);
  setState(() {
  serverdata = response.body;
  });

  }
}
