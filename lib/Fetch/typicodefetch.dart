import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project2/ModalClass/typicode.dart';

class typicolist extends StatefulWidget {
  const typicolist({Key key}) : super(key: key);

  @override
  _typicolistState createState() => _typicolistState();
}

class _typicolistState extends State<typicolist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Model>>(
          future: fetchPost(),
          builder: (context, snapshot) {
            List<Model> list = snapshot.data;
            if (snapshot.hasData) {
              return Center(
                  child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(list[index].postId.toString()),
                    title: Text(list[index].name),
                    subtitle: Text(list[index].email),
                    trailing: Text(list[index].id.toString()),

                  );
                },
              ));
            } else {
              return Center(child: CircularProgressIndicator.adaptive());
            }
          }),
    );
  }

  Future<List<Model>> fetchPost() async {
    final response = await http
        .get('https://jsonplaceholder.typicode.com/comments');

    if (response.statusCode == 200) {
      List responseList = json.decode(response.body);
      return responseList.map((data) => Model.fromJson(data)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
