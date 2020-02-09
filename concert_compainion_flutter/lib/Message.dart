import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Person.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Concert Companion"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              Navigator.pushNamed(context, '/swipe');
            },
          ),
          // action button
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.pushNamed(context, '/message');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Person>>(
        future: getPerson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          List<Person> data = snapshot.data;
          return getListView(data);
          } else {
          return Text("Not working");
          }
        },
      ),
    );
  }


  Future<List<Person>> getPerson() async {
    final url = 'https://uinames.com/api/amount=30';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((person) => new Person.fromJson(person)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Widget getListView(data) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data),
            //title: Text("test"),
          );
        });
  }
}
