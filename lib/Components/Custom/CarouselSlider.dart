import 'package:flutter/material.dart';

class PortfolioSlider extends StatefulWidget {
  @override
  _PortfolioSliderState createState() => _PortfolioSliderState();
}

class _PortfolioSliderState extends State<PortfolioSlider> {
  final PageController _pageController = PageController();
  
  final List<Map<String, String>> portfolioItems = [
    {"image": "images/portfolio1.jpeg", "title": "Portfolio 1"},
    {"image": "images/portfolio2.jpeg", "title": "Portfolio 2"},
    {"image": "images/portfolio3.jpeg", "title": "Portfolio 3"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Set a fixed height for vertical scrolling
      child: PageView.builder(
        scrollDirection: Axis.vertical, // Enables vertical movement
        controller: _pageController,
        itemCount: portfolioItems.length,
        itemBuilder: (context, index) {
          return _buildPortfolioItem(portfolioItems[index]);
        },
      ),
    );
  }

  Widget _buildPortfolioItem(Map<String, String> item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, spreadRadius: 2),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(item["image"]!, width: double.infinity, height: 300, fit: BoxFit.cover),
            Container(
              color: Colors.black.withOpacity(0.6),
              padding: EdgeInsets.all(10),
              child: Text(
                item["title"]!,
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
