import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Concert Compainion"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.find_in_page),
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
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}