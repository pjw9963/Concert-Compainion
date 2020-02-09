import 'package:flutter/material.dart';
import 'Login_Form.dart';
import 'Home.dart';
import 'Swipe.dart';
import 'Message.dart';

void main() => runApp(MyApp());


Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

var _green = hexToColor("#1DB954");
var _black = hexToColor("#191414");
var _background_grey = hexToColor("#46464a");

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Concert Compainion Login',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          //'/swipe': (context) =>
        },
        theme: ThemeData(
          canvasColor: _background_grey,
          fontFamily: 'BebasNeue',
          primaryColor: _green,
          buttonTheme: ButtonThemeData(
            buttonColor: _green,
          ),
          accentColor: _green,
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: _green),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
    ),
    );
  }
}


