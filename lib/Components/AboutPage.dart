import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

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
    double contentWidth = screenWidth > 800 ? 700 : screenWidth * 0.9;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.8),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: Image.asset(
            'images/baselinelogo.png',
            width: screenWidth * 0.3,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildAnimatedSection(
              icon: FontAwesomeIcons.infoCircle,
              title: "About Us",
              description: "We are dedicated to creating impactful, innovative digital solutions...",
              width: contentWidth,
            ),
            const SizedBox(height: 15),
            _buildAnimatedSection(
              icon: FontAwesomeIcons.laptopCode,
              title: "Our Services",
              description: "We Provide Web Design, Development, and Digital Marketing Solutions...",
              width: contentWidth,
            ),
            const SizedBox(height: 15),
            FadeInUp(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone, color: Colors.white),
                label: const Text("Get in Touch", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: [
                _buildCard(
                  title: "Our Mission",
                  description: "Deliver exceptional web development, app creation, and digital marketing solutions...",
                  icon: FontAwesomeIcons.bullseye,
                  width: contentWidth,
                ),
                _buildCard(
                  title: "Our Vision",
                  description: "Become a global leader in IT solutions, recognized for excellence and innovation...",
                  icon: FontAwesomeIcons.circleInfo,
                  width: contentWidth,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Image.network(
              "https://media.licdn.com/dms/image/v2/C5616AQEgHrOVxFcQiQ/profile-displaybackgroundimage-shrink_200_800/profile-displaybackgroundimage-shrink_200_800/0/1642590523710?e=2147483647&v=beta&t=smCeofQCuaCg9BPbpjO99ZKLvBxkFJyIl4Po01-OD40",
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              width: contentWidth,
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: [
                _buildCard(
                  title: "Our Story",
                  description: "Baseline IT Development was founded in 2012 with a simple goal: helping businesses grow through technology solutions...",
                  icon: FontAwesomeIcons.bullseye,
                  width: contentWidth,
                ),
                _buildCard(
                  title: "Why Choose Us?",
                  description: "Custom Solutions, Latest Technology, Client-Focused Approach, Proven Success...",
                  icon: FontAwesomeIcons.circleInfo,
                  width: contentWidth,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSection({
    required IconData icon,
    required String title,
    required String description,
    required double width,
  }) {
    return FadeInLeft(
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffc84e89), Color(0xfffa002e)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFD5D4D4), width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required IconData icon,
    required double width,
  }) {
    return ZoomIn(
      child: Container(
        width: width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffc84e89), Color(0xfffa002e)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFD5D4D4), width: 2),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, offset: const Offset(1, 3), blurRadius: 3)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(width: 10),
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}