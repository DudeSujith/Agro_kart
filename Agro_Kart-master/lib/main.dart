import 'package:flutter/material.dart';
import 'lodingpage.dart';
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer (Duration(seconds: 4),()=>
        Navigator.push(context, MaterialPageRoute(
          builder:(context)=> Landingpage(),
        ),)
       );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    body: WavyAnimatedTextKit(

      textStyle: TextStyle(
        color: Colors.white,
          fontSize: 50.0,
          fontWeight: FontWeight.bold
      ),
      text: [
        "Breaking Code",

      ],
      isRepeatingAnimation: true
    )
    );
  }
}
