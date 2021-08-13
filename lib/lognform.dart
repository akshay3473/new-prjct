import 'package:flutter/material.dart';
import 'package:project2/regformsave.dart';
import 'package:shared_preferences/shared_preferences.dart';


class logn extends StatefulWidget {
  const logn({Key key}) : super(key: key);

  @override
  _lognState createState() => _lognState();
}

class _lognState extends State<logn> {

  String name;
  String pass;
  final key=GlobalKey<FormState>();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController passwrdcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    floatClick();
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
                  }else if(value != name){
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
                  }else if(value != pass)
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

                if(key.currentState.validate()){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => regopen()));

                }


              },
            ),


          ],
        ),
      ),
    );
  }
  floatClick()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("stringname") ?? "no val";
      pass = prefs.getString("stringpsswrd") ?? "no val";
    });
    }
}
