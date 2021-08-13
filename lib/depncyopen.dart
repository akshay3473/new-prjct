import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class depncyopn extends StatefulWidget {
  const depncyopn({Key key}) : super(key: key);

  @override
  _depncyopnState createState() => _depncyopnState();
}

class _depncyopnState extends State<depncyopn> {
  var data="hai";
  @override
  Widget build(BuildContext context) {
    floatClick();
    return Scaffold(appBar: AppBar(),
    body: Column(
      children: [
        Container(
          height: 400,
            width: 400,
          child: Text(data),
        ),
        ElevatedButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
        }, child: Text("click"))
      ],
    ),);
  }
 floatClick()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     data = prefs.getString("stringValue")??"no val";

  }
}
