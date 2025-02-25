import 'package:baseline/Components/Custom/JobCard.dart';
import 'package:baseline/Components/Custom/phpJobCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Career extends StatefulWidget {
  const Career({super.key});

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.8),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04),
          child: Image.asset(
            'images/baselinelogo.png',
            width: screenWidth * 0.3,
            colorBlendMode: BlendMode.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: _buildJobOpeningCard(),
              ),
            ),
            SizedBox(height: 15),
            SlideTransition(
              position: _slideAnimation,
              child: _buildVacanciesText(),
            ),
            SizedBox(height: 15),
            SlideTransition(
              position: _slideAnimation,
              child: _buildLatestJobs(),
            ),
            SizedBox(height: 10),
            SlideTransition(
              position: _slideAnimation,
              child: JobCard(),
            ),
            SizedBox(height: 10),
            SlideTransition(
              position: _slideAnimation,
              child: PhpJobCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobOpeningCard() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Current Job Openings",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "We have several job openings available! At Baseline IT Development, we foster a dynamic work environment. Apply now!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
            ),
            child: Text(
              "Opening Jobs",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVacanciesText() {
    return RichText(
      text: TextSpan(
        text: 'Current ',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: 'Vacancies',
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestJobs() {
    return Column(
      children: [
        Text(
          "We are currently seeking talented individuals to join our team in various roles at Baseline IT Development.",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Latest Jobs",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}