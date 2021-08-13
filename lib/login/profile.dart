import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class profile extends StatefulWidget {
  const profile({Key key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {


  @override
  Widget build(BuildContext context) {




    return Scaffold(

      appBar: AppBar(),
      body: FutureBuilder<String>(
        future: userdata(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if(snapshot.hasData) {
            return
                  Center(child: Container(child: Container(height: 100,
                      width: 100,
                      color: Colors.lightGreenAccent,child: Text(snapshot.data))));

          }
          else{
              return Center(child: CircularProgressIndicator.adaptive());
         }
          }

      ),

    );
  }



   Future<String>userdata() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String val= prefs.getString("userid")??"no val";
     var apiurl = "https://thefuturalabs.com/projects/test/profile.php";

     Map userdata = {
      'u_id': val,
    };

    print(userdata);

      http.Response response = await http.post(apiurl, body: userdata);
      print(response.body);


    Map data = jsonDecode(response.body);
    String name = data['username'];
    String mob = data['mobile'];
    String addrs = data['address'];

    print('$name $mob $addrs');
    return ('$name $mob $addrs');
  }
}
