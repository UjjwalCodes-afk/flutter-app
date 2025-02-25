
// import 'package:baseline/Components/Navbar/Navbar.dart';
// import 'package:baseline/Components/Register.dart';

// import 'package:baseline/Components/HomePage.dart';
// import 'package:baseline/Components/HomePage.dart';

import 'package:baseline/Components/SplashScreen.dart';


// import 'package:baseline/Components/SplashScreen.dart';
// import 'package:baseline/Components/SplashScreen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});
  @override
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light,primarySwatch: Colors.red, scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData(brightness: Brightness.dark,primarySwatch: Colors.red,scaffoldBackgroundColor: Colors.white),
      home : Splashscreen(),
    );
  }
}