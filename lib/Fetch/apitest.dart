import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:project2/ModalClass/api2.dart';
class apitest extends StatefulWidget {
  const apitest({Key key}) : super(key: key);

  @override
  _apitestState createState() => _apitestState();
}
class _apitestState extends State<apitest> {
  Future <UsersClass> getusers() async{
    var url ="https://reqres.in/api/users";
    var responce = await http.get(url);
    if (responce.statusCode==200){
      return UsersClass.fromJson(jsonDecode(responce.body));
    }else{
      print("no connection");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        FutureBuilder(
            future: getusers(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                List <Datum> list = snapshot.data.data;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: CircleAvatar(child: Image.network(list[index].avatar),),
                        title: Text(list[index].firstName+ "  " +list[index].lastName),
                        subtitle: Text(list[index].email),
                        trailing: Text(list[index].id.toString()),
                      );

                    });
              }else{
                return CircularProgressIndicator.adaptive();
              }
            })
      ],),
    );
  }
}
