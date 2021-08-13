import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project2/ModalClass/albumdet.dart';
import 'package:http/http.dart'as http;
import 'package:url_launcher/url_launcher.dart';
class album1 extends StatefulWidget {
  const album1({Key key}) : super(key: key);

  @override
  _album1State createState() => _album1State();
}

class _album1State extends State<album1> {


  Future <List<Albums>> getdet() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(url);
    List <Albums> arr = [];
    if (res.statusCode == 200) {
      var file = jsonDecode(res.body);
      for (var i in file) {
        Albums data = Albums(
          i["albumId"],
          i["id"],
          i["title"],
          i["url"],
          i["thumbnailUrl"],


        );
        arr.add(data);
      }
    } else {
      print("No connection");
    }

    return arr;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdet();
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
                  physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index)

                    {
                      var url = snapshot.data[index].url;

                      void launchUrl() async =>
                        await canLaunch(url) ? await launch(url) : throw "not working";

                      return ListTile(
                      leading: CircleAvatar(),
                      title: Text(snapshot.data[index].title.toString()),
                        onTap: (){
                        launchUrl();
                        },

                    );
                    }
                );}
          )
        ],
      ),

    );
  }
}
