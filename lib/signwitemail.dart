import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Fetch/api1.dart';
class firbase extends StatefulWidget {
  const firbase({Key key}) : super(key: key);

  @override
  _firbaseState createState() => _firbaseState();
}

class _firbaseState extends State<firbase> {
  TextEditingController email=TextEditingController();
  TextEditingController passwrd=TextEditingController();

  String message;

  _login() async{
    try{

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: passwrd.text);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>apismple()));

    }
    on FirebaseAuthException catch(e) {
      message = '';

      switch(e.code){

        case 'invalid-email':
          message = "Email you entered is invalid";
          break;

        case 'wrong-password':
          message = "Password you entered is invalid";
          break;

      }

      showDialog(context: context,
          builder: (context){

        return AlertDialog(
          title: Text('Login Failed'),
          content: Text(message),

        );

          });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Container(height: 200,
          width: 200,
          child: ListView(
            children: [Text("login page"),
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: "email"),

            ),
              TextFormField(
                controller: passwrd,
                decoration: InputDecoration(hintText: "password"),

              ),
              ElevatedButton(onPressed: (){
                _login();

              },
                  child: Text("login"))
            ],
          ),),

    );
  }
}
