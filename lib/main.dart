import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2/regform.dart';
import 'package:project2/signwitemail.dart';
import 'package:project2/toodl.dart';

import 'Fetch/albumapi.dart';
import 'Fetch/api1.dart';
import 'Fetch/apitest.dart';
import 'Fetch/compnyfetch.dart';
import 'Fetch/empdtApi.dart';
import 'Fetch/gridviewcompny.dart';
import 'Fetch/typicodefetch.dart';
import 'api/adminusr.dart';
import 'api/jsonobjct.dart';
import 'apinew.dart';
import 'depnt.dart';
import 'flipkrt.dart';
import 'login/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done){
          return Center(child: CircularProgressIndicator.adaptive());

        }
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: typicolist(),
        );
      }
    );
  }
}

