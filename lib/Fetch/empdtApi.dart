import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:project2/ModalClass/empdetails.dart';

class empdet extends StatefulWidget {
  const empdet({Key key}) : super(key: key);

  @override
  _empdetState createState() => _empdetState();
}

class _empdetState extends State<empdet> {

  Future <List<Empdetails>> getdet() async{

    var url="https://mock-json-service.glitch.me/";
    var res = await http.get(url);
    List <Empdetails> arr = [];
    if(res.statusCode==200){
      var file=jsonDecode(res.body);
      for(var i in file) {
        Empdetails data = Empdetails(
          i["company"],
          i["description"],
          i["employmentType"],
          i["id"],
          i["location"],
          i["position"],


        );
        arr.add(data);
      }


    }else{print("No connection");
    }
    return arr;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
              future: getdet(),
              builder: (context,snapshot){
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,


                    itemBuilder: (context,index)

                {return ListTile(
                leading: CircleAvatar(),
                title: Text(snapshot.data[index].company),

                );
              }
              );}
              )
        ],
      ),
    );
  }
}
