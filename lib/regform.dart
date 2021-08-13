import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project2/regformsave.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lognform.dart';

class regform extends StatefulWidget {
  const regform({Key key}) : super(key: key);

  @override
  _regformState createState() => _regformState();
}

class _regformState extends State<regform> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phno = new TextEditingController();
  TextEditingController passwrd = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.amberAccent,

        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)))),
                ),
                TextField(controller: email,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)))),
                ),
                TextField(controller: phno,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Phone number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)))),
                ),
                TextField(controller: passwrd,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)))),
                ),
                ElevatedButton(onPressed: () {

                  _addStringToSF(name.text,email.text,phno.text,passwrd.text);


                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${name.text}  ${email.text}  ${phno.text}  ${passwrd.text}')));
                },
                    child: Text("open")),
                ElevatedButton(onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => logn()),);
                },

                  child: Text("save"),)
              ]),


        ),
      ),


    );
  }

  _addStringToSF(String name,String mail,String phno,String psswrd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringname', name);
    prefs.setString('stringmail', mail);
    prefs.setString('stringphno', phno);
    prefs.setString('stringpsswrd', psswrd);
  }
}
