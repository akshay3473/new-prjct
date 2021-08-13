import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:project2/ModalClass/compny.dart';
class compny extends StatefulWidget {
  const compny({Key key}) : super(key: key);

  @override
  _compnyState createState() => _compnyState();
}

class _compnyState extends State<compny> {
  Future <Compny> getusers() async{
    var url="https://dummy.restapiexample.com/api/v1/employees";
    var response = await http.get(url);
    if(response.statusCode==200){
      return Compny.fromJson(jsonDecode(response.body));
    }else{
      print("No data");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        FutureBuilder(
            future: getusers(),
            builder: (context,snapshot){
              List <Datum> list = snapshot.data.data;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(list[index].employeeName),
                    );

                  });
            })
      ],),
    );
  }
}
