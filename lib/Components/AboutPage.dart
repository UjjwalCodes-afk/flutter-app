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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "About Us",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We are dedicated to creating impactful, innovative digital solutions that empower businesses to succeed. Based in Mohali, India, our team of experienced developers, designers, and strategists is passionate about turning ideas into dynamic, high-performance websites and applications.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text("We Provide Web Design, Development, and Digital Marketing Solutions", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
