import 'package:baseline/Components/HomePage.dart';

import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
   const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToNextScreen();
  }
  _navigateToNextScreen()async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/baselinelogo.png', height: 80, width: 350,),
            SizedBox(height: 60,),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("Building Careers & Transforming Lives", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, wordSpacing: 3, letterSpacing: 4, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}