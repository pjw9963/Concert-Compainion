import 'package:flutter/material.dart';
import 'login_button.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    authenticate(String username) {
      // reach out to api and authenticate username
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Concert Compainion Login',
      theme: ThemeData(
        fontFamily: 'BebasNeue',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: new Material(
        child: new Container(
          padding: const EdgeInsets.all(30.0),
          color: hexToColor("#46464a"),
          child: new Container(
            child: new Center(
              child: new Column(
                  children : [
              new Padding(padding: EdgeInsets.only(top: 140.0)),
            new Text('Concert Compainion',
              style: new TextStyle(color: Colors.black, fontSize: 30.0, fontFamily: "BebasNeue"),),
            new Padding(padding: EdgeInsets.only(top: 50.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Spotify Username",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                fillColor: Colors.green,
                filled: true,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                ),
                //fillColor: Colors.g reen
              ),
              validator: (val) {
                if(val.length==0) {
                  return "Username cannot be empty";
                }else{
                  return null;
                }
              },
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 50)),
            new LoginButton(onPressed: authenticate(""))
              ]
              ),
            )
          ),
        )
      ),
    );
  }
}
