import 'package:flutter/material.dart';

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
          style: Theme.of(context).textTheme.button,
          decoration: new InputDecoration(
            labelText: "Enter Spotify Username",
            labelStyle: TextStyle(fontSize: 18),
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
        ),
        new Padding(padding: EdgeInsets.only(top: 50)),
        new RaisedButton(
          animationDuration: Duration(seconds: 2),
          onPressed: () {
            //myController.text send to api for sign in
            Navigator.pushNamed(context, '/home');
          },
          padding: EdgeInsets.all(5),
          elevation: 5.0,
          child: Text("Continue", style: TextStyle(fontSize: 18),),
        )
      ],
    );
  }

}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
          child: new Container(
            padding: const EdgeInsets.all(30.0),
            child: new Container(
                child: new Center(
                  child: new Column(
                      children : [
                        new Padding(padding: EdgeInsets.only(top: 90.0)),
                        new Text('Concert Companion',
                          style: Theme.of(context).textTheme.headline,
                        ),
                        new Padding(padding: EdgeInsets.only(top: 50.0)),
                        new MyCustomForm(),
                      ]
                  ),
                )
            ),
          )
      );
  }
}