import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project2/login/registratn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';


class lognfrm extends StatefulWidget {
  const lognfrm({Key key}) : super(key: key);

  @override
  _lognState createState() => _lognState();
}

class _lognState extends State<lognfrm> {

  String username;
  String password;
  final key=GlobalKey<FormState>();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController passwrdcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: key,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text("Login Screen"),

            SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "please enter your name";
                  }else if(value != username){
                    return "invalid name";
                  }
                  else
                    return null;
                },
                controller: namecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: TextFormField(
                obscureText: true,
                controller: passwrdcontroller,
                validator: (value){
                  if(value.isEmpty){
                    return "Password Invalid";
                  }else if(value != password)
                  {
                    return "invalid password";
                  }
                  else
                    return null;

                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password"
                ),
              ),
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: (){
                Registeruser();



                if(key.currentState.validate()){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => Dash()));

                }


              },
            ),
            RaisedButton(
              child: Text('Not yet registered'),
              onPressed: (){



                  Navigator.push(context, MaterialPageRoute(builder: (context) => regstn()));




              },
            ),


          ],
        ),
      ),
    );
  }
  Future<String>Registeruser() async {
    var apiurl = "https://thefuturalabs.com/projects/test/login.php";

    Map Mapdata = {
      'username': namecontroller.text,
      'password': passwrdcontroller.text,



    };
    

    http.Response response = await http.post(apiurl, body: Mapdata);

    Map data = jsonDecode(response.body);
    String message = data['message'];
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
    if (message == "success") {

      saveUser(data['u_id']);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Dash()));

    }
  }
  saveUser(String uid)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userid", uid);
  }

}


