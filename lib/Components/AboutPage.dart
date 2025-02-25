import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.8),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.15),
          child: Image.asset(
            'images/baselinelogo.png',
            colorBlendMode: BlendMode.color,
            width: screenWidth * 0.3,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      body: Center(
        child: Text("About Page"),
      ),
    );
  }
}