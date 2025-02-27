import 'package:flutter/material.dart';

class ResponsiveRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // 🖥 **Desktop & Tablet Layout (Image Left, Text Right)**
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🖼 **Image on the Left**
                Image.asset(
                  "images/opo.png",
                  width: screenWidth * 0.3, // 30% of screen width
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 20),

                // 📝 **Text on the Right**
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Baseline IT Development - Your Global Technology Partner",
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "We go beyond web development—we are your trusted partner in creating innovative digital solutions that drive success. "
                        "With a team of over 150+ skilled professionals, we specialize in software & application development, web development, "
                        "website design, and digital marketing to help businesses thrive in the digital landscape.",
                        style: TextStyle(fontSize: screenWidth * 0.018),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            // 📱 **Mobile Layout (Stacked: Image Above, Text Below)**
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🖼 Centered Image
                Image.asset(
                  "images/opo.png",
                  width: screenWidth * 0.6,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16),

                // 📝 Text Below
                Text(
                  "Welcome to Baseline IT Development - Your Global Technology Partner",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),

                // 📝 Detailed Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "We go beyond web development—we are your trusted partner in creating innovative digital solutions that drive success. "
                    "With a team of over 150+ skilled professionals, we specialize in software & application development, web development, "
                    "website design, and digital marketing to help businesses thrive in the digital landscape.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
