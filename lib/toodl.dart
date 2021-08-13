import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class tood extends StatefulWidget {
  const tood({Key key}) : super(key: key);

  @override
  _toodState createState() => _toodState();
}

class _toodState extends State<tood> {
  TextEditingController  namecontroller = new TextEditingController();
  String name;

  @override
  Widget build(BuildContext context) {
    _floatClick();

    return Scaffold(body: Form(
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [


          Text("Login Screen"),

          SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40),
            child: TextFormField(

              controller: namecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your name"
              ),
            ),
          ),

          RaisedButton(
            child: Text('add'),
            onPressed: (){

              _addStringToSF(namecontroller.text);
              namecontroller.text = "";











            },
          ),
          RaisedButton(
            child: Text('clear'),
            onPressed: (){
              Fluttertoast.showToast(
                msg: "cleared");
             _clearShared();

            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Container(
              width: 400,
              child: Text(name),
            )],
          ),

        ],
      ),
    ),
    );
  }
  _floatClick()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    name = prefs.getString("stringname") ?? "no value";
    });
  }


  _addStringToSF(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String previous = prefs.getString("stringname") ?? "";
    prefs.setString('stringname', previous + "\n"+name);

  }
  _clearShared() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
