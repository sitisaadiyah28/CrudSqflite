import 'dart:async';

import 'package:crud_sqflite/LoginPage.dart';
import 'package:crud_sqflite/list_mahasiswa.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: SplashscreenPage(),
  debugShowCheckedModeBanner: false,
));

class SplashscreenPage extends StatefulWidget {
  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  void initState(){
    super.initState();
    startSplashScreen();
  }
  startSplashScreen() async{
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){

          return LoginPage();
        }),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "images/Splashscreen.jpg",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

