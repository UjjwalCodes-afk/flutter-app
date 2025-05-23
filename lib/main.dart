import 'package:baseline/Components/SplashScreen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
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