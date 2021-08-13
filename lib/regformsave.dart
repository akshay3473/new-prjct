import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class regopen extends StatefulWidget {
  const regopen({Key key}) : super(key: key);

  @override
  _regopenState createState() => _regopenState();
}

class _regopenState extends State<regopen> {
  var name="loading..";
  var email="loading..";
  var mobile="loading..";
  var pass="loading..";
  @override
  Widget build(BuildContext context) {
    floatClick();
    return Scaffold(appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 400,
            child: Text('name = $name \nemail = $email\nmobile = $mobile\npassword = '+ pass),
          ),
          ElevatedButton(onPressed: (){

            Fluttertoast.showToast(
              msg: "Hello, World!",

            );
          }, child: Text("click"))
        ],
      ),);
  }
  floatClick()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("stringname")??"no val";
      email = prefs.getString("stringmail")??"no val";
      mobile = prefs.getString("stringphno")??"no val";
      pass = prefs.getString("stringpsswrd")??"no val";
    });

  }
}
