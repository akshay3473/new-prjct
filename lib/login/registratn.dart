import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'login.dart';



class regstn extends StatefulWidget {
  const regstn({Key key}) : super(key: key);

  @override
  _regformState createState() => _regformState();
}

class _regformState extends State<regstn> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController address = new TextEditingController();


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
        color: Colors.blueGrey,

        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TextField(
                  controller: username,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)))),
                ),
                TextField(controller: password,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)))),
                ),
                TextField(controller: mobile,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Mobile",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)))),
                ),
                TextField(controller: address,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)))),
                ),
                ElevatedButton(onPressed: () {
                  Registeruser();

                  // _addStringToSF(username.text,password.text,mobile.text,address.text);



                },
                    child: Text("Register")),
                ElevatedButton(onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => lognfrm()),);
                },

                  child: Text("Already registered"),)
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

  Future Registeruser() async{
    var apiurl="https://thefuturalabs.com/projects/test/register.php";

    Map Mapdata={
      'username':username.text,
      'password':password.text,
      'mobile':mobile.text,
      'address':address.text


    };

    http.Response response= await http.post(apiurl,body: Mapdata);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.body)));
  }
}
