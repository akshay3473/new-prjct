import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'depncyopen.dart';
class dentcy extends StatefulWidget {
  const dentcy({Key key}) : super(key: key);

  @override
  _dentcyState createState() => _dentcyState();
}

class _dentcyState extends State<dentcy> {
  TextEditingController txt = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: txt,

              cursorColor: Colors.red,
              decoration: InputDecoration(

                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),

              ),),
          ),
          ElevatedButton(onPressed: (){
            _addStringToSF(txt.text);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(txt.text)));



          },
              child: Text("open")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>depncyopn()),);

          },

              child: Text("save"),)
        ],
      ),
    );
  }
  _addStringToSF(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', value);
  }
}
