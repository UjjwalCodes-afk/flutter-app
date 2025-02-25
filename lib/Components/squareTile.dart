import 'package:flutter/material.dart';

class Squaretile extends StatelessWidget {
  final String imagePath;
  const Squaretile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Image.asset(
        imagePath,
        height: 100,
        width: 350,
      ),
    );
  }
}