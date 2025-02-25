
import 'package:baseline/Components/Blogs.dart';
import 'package:baseline/Components/Careers.dart';
import 'package:baseline/Components/Contact.dart';
import 'package:baseline/Components/PortFolio.dart';
import 'package:flutter/material.dart';

Drawer customDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(stops: [0.33,0.85], begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0xBFFD1D1D),Color(0xFF3A4CB4)])
      
      
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header with Image and Background Color
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent, // Make background transparent
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image or App Logo
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/bgm.png'), // Your image
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome User",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Drawer Items
          _drawerItem(Icons.home, "Home", () {}),
          SizedBox(height: 5,),
          _drawerItem(Icons.analytics_outlined, "PortFolio", () {
            Navigator.pop(context);
           Navigator.push(context, MaterialPageRoute(builder: (context) => Portfolio()));
          }),
          SizedBox(height: 5,),
          _drawerItem(Icons.phone, "Contact", () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
          }),
          SizedBox(height: 5,),
          _drawerItem(Icons.accessibility_sharp, "Careers", (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Career()));
          }),
          SizedBox(height: 5,),
          _drawerItem(Icons.co_present_outlined, "Blogs", (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyBlog()));
          })

        ],
      ),
    ),
  );
}

// Function to Create Drawer Items
Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
    onTap: onTap,
  );
}
