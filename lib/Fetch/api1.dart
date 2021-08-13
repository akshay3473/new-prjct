import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project2/ModalClass/api2.dart';
import 'package:http/http.dart'as http;
class apismple extends StatefulWidget {
  const apismple({Key key}) : super(key: key);

  @override
  _apismpleState createState() => _apismpleState();
}

class _apismpleState extends State<apismple> {

  Future <UsersClass> getusers() async{
    var url="https://reqres.in/api/users";
    var response = await http.get(url);
    if(response.statusCode==200){
      return UsersClass.fromJson(jsonDecode(response.body));
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
                    leading: CircleAvatar(child: Image.network(list[index].avatar),),
                    title: Text(list[index].firstName),
                  );
                
              });
            })
      ],),
    );
  }
}
