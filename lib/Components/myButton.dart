import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() ? onTap;
  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black
        ),
        child: const Center(
          child: Text("Sign in", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, wordSpacing:1, letterSpacing: 2),),
        ),
      ),
    );
  }
}