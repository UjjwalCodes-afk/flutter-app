import 'package:flutter/material.dart';
import 'dart:async';

class ContinuousSlider extends StatefulWidget {
  @override
  _ContinuousSliderState createState() => _ContinuousSliderState();
}

class _ContinuousSliderState extends State<ContinuousSlider> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  final List<String> imagePaths = [
    'images/flutter.png',
    'images/in22.png',
    'images/java-22.png',
    'images/laravel22.png',
    'images/zapier22.png',
    'images/salesforce22.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        
        if (currentScroll >= maxScroll) {
          _scrollController.jumpTo(0); // ✅ Reset to start when reaching the end
        } else {
          _scrollController.jumpTo(currentScroll + 2);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
      ),
      child: SizedBox(
        height: 150, // Adjust height as needed
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(), // Prevent manual scrolling
          itemCount: imagePaths.length * 5, // Repeating images for seamless effect
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePaths[index % imagePaths.length], // Loop images
                  fit: BoxFit.contain,
                  width: 140, // Adjust width as needed
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
