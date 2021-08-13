

import 'package:flutter/material.dart';
import 'package:project2/login/profile.dart';

class Dash extends StatefulWidget {
  const Dash({Key key}) : super(key: key);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:GridView.count(crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [Center(
                child: Container(child:
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));






                  },
                      child: Text("open"))),
              )

              ])
        ,

    );
  }


  }
