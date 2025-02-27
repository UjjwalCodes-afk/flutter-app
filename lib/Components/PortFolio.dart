import 'package:flutter/material.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  List<String> imageNames = ["portfolio1.jpeg", "portfolio2.jpeg", "portfolio1.jpeg"];
  List<String> imageSeo = ["images/seo1.png", "images/seo2.png", "images/seo3.png", "images/seo4.png"];
  List<bool> _isHovered = [];

  @override
  void initState() {
    super.initState();
    _isHovered = List.generate(imageNames.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.8),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: Image.asset('images/baselinelogo.png', width: screenWidth * 0.3),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            _buildJobOpeningCard(),
            SizedBox(height: 20),
            _buildSectionTitle("Success Stories We Have Built"),
            SizedBox(height: 20),

            // Portfolio Image Grid
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: List.generate(
                imageNames.length,
                (index) => _buildHoverImage(index, screenWidth / 4),
              ),
            ),

            SizedBox(height: 20),
            _buildSectionTitle("SEO Portfolio"),
            SizedBox(height: 10),

            // SEO Portfolio Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth < 600 ? 2 : 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: imageSeo.length,
              itemBuilder: (context, index) => _buildImage(imageSeo[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.width * 0.05,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildJobOpeningCard() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red.withOpacity(0.8),
        boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Our Portfolio",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "At Baseline IT Development, we take pride in delivering high-quality IT solutions that drive results.",
            style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 0.5),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          _buildButton("Opening Jobs", Colors.white, Colors.red, () {}),
          SizedBox(height: 10),
          _buildButton("Book A Consultation", Colors.red.shade900, Colors.white, () {}),
        ],
      ),
    );
  }

  Widget _buildHoverImage(int index, double imageSize) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered[index] = true),
      onExit: (_) => setState(() => _isHovered[index] = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: _isHovered[index] ? Matrix4.translationValues(0, -10, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: _isHovered[index]
              ? [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 6)]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'images/${imageNames[index]}',
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
