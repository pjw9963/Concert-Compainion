import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

var _green = hexToColor("#1DB954");
var _black = hexToColor("#191414");
var _background_grey = hexToColor("#46464a");

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        new TextFormField(
          controller: myController,
          decoration: new InputDecoration(
            labelText: "Enter Spotify Username",
            labelStyle: TextStyle(color: _black, fontSize: 18),
            fillColor: _green,
            filled: true,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
            ),
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
        new RaisedButton(
          color: _black,
          splashColor: _green,
          animationDuration: Duration(seconds: 2),
          onPressed: () {
            //myController.text send to api for sign in
          },
          padding: EdgeInsets.all(5),
          elevation: 5.0,
          child: Text("Continue", style: TextStyle(fontSize: 18, color: _green),),
        )
      ],
    );
  }

}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Concert Compainion Login',
      theme: ThemeData(
        fontFamily: 'BebasNeue',
      ),
      home: new Material(
          child: new Container(
            padding: const EdgeInsets.all(30.0),
            color: _background_grey,
            child: new Container(
                child: new Center(
                  child: new Column(
                      children : [
                        new Padding(padding: EdgeInsets.only(top: 140.0)),
                        new Text('Concert Compainion',
                          style: new TextStyle(color: _green, fontSize: 30.0, fontFamily: "BebasNeue"),),
                        new Padding(padding: EdgeInsets.only(top: 50.0)),
                        new MyCustomForm(),
                      ]
                  ),
                )
            ),
          )
      ),
    );
  }
}