import 'package:flutter/material.dart';

class MyBlog extends StatefulWidget {
  const MyBlog({super.key});

  @override
  State<MyBlog> createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlog> {
  final List<String> imagePaths = [
    "images/baselinebanner.png",
    "images/service4.jpg",
    "images/service5.jpg",
    "images/services3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textScale = screenWidth / 400; // Dynamic scaling for text size
    int crossAxisCount = screenWidth > 600 ? 3 : 2; // 3 columns for tablets, 2 for phones

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        title: Center(
          child: Image.asset(
            'images/baselinelogo.png',
            width: screenWidth * 0.25,
          ),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red.shade700,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 5,
                      color: Colors.black26,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Explore Our Latest Insights & Updates",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24 * textScale,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Stay updated with the latest trends, news, and insights in the tech world. Explore our blogs for valuable content on technology and innovation.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16 * textScale,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        // Handle "Read More" action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Read More"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Featured Blog Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured Blogs",
                  style: TextStyle(
                    fontSize: 22 * textScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade800,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Responsive Image Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount, // 2 for phones, 3 for tablets
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1, // Keeps images square
                    ),
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover, // Ensures images cover the space
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 30),

              // Blog Content Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Latest Articles",
                  style: TextStyle(
                    fontSize: 22 * textScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade800,
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Blog Post Example
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Future of AI in Business",
                      style: TextStyle(
                        fontSize: 20 * textScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Artificial Intelligence is transforming the business landscape. Discover how companies are leveraging AI for efficiency, automation, and innovation.",
                      style: TextStyle(
                        fontSize: 16 * textScale,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to full article
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade800,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Read Full Article"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
