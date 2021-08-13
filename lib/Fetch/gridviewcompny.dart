import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:project2/ModalClass/compny.dart';
class grdvwcompny extends StatefulWidget {
  const grdvwcompny({Key key}) : super(key: key);

  @override
  _grdvwcompnyState createState() => _grdvwcompnyState();
}

class _grdvwcompnyState extends State<grdvwcompny> {
  var url="https://www.youtube.com/";

  void launchUrl() async =>
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';



  Future <Compny> getusr() async{
    var url="https://dummy.restapiexample.com/api/v1/employees";
    var rspnc= await http.get(url);
    if(rspnc.statusCode==200){
      return Compny.fromJson(jsonDecode(rspnc.body));
    }else{
      print("no connection");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FutureBuilder(
            future: getusr(),
            builder: (context, snapshot) {
              if(snapshot.hasData){

                List<Datum> data=snapshot.data.data;
                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemCount: data.length,
                    itemBuilder: (context,index){
                      return Container(
                        child: Text(data[index].employeeName),
                      );
                    }
                );

              }else{
                return Center(child: CircularProgressIndicator.adaptive());
              }

            }
          ),


          ElevatedButton(onPressed: (){
            launchUrl();

          }, child: Icon(Icons.web))
        ],
      ),
    );
  }
}
