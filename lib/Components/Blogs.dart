import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyBlog extends StatefulWidget {
  const MyBlog({super.key});

  @override
  State<MyBlog> createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlog> with TickerProviderStateMixin {
  final List<String> imagePaths = [
    "images/baselinebanner.png",
    "images/service4.jpg",
    "images/service5.jpg",
    "images/services3.jpg",
  ];

  late AnimationController _buttonController;
  late Animation<double> _buttonScaleAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Button Animation
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.0,
    );
    _buttonScaleAnimation = CurvedAnimation(
      parent: _buttonController,
      curve: Curves.easeOut,
    );

    // Fade Animation for Header & Blog Section
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textScale = screenWidth / 400;
    int crossAxisCount = screenWidth > 600 ? 3 : 2;

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
              // Animated Header Section
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red.shade700,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 5,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Column(
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
                      const SizedBox(height: 10),
                      Text(
                        "Stay updated with the latest trends, news, and insights in the tech world.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16 * textScale,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ScaleTransition(
                        scale: _buttonScaleAnimation,
                        child: GestureDetector(
                          onTapDown: (_) => _buttonController.reverse(),
                          onTapUp: (_) => _buttonController.forward(),
                          child: ElevatedButton(
                            onPressed: () {}, // Your onPressed logic
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Read More"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

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
              const SizedBox(height: 10),

              // Animated Image Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 500),
                        tween: Tween<double>(begin: 0.8, end: 1.0),
                        curve: Curves.easeOut,
                        builder: (context, double scale, child) {
                          return Transform.scale(
                            scale: scale,
                            child: child,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
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
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 30),

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
              const SizedBox(height: 15),

              // Blog Post Example with Slide Animation
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(_fadeController),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: const [
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
                      const SizedBox(height: 8),
                      Text(
                        "Artificial Intelligence is transforming the business landscape. Discover how companies are leveraging AI for efficiency and innovation.",
                        style: TextStyle(
                          fontSize: 16 * textScale,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ScaleTransition(
                        scale: _buttonScaleAnimation,
                        child: GestureDetector(
                          onTapDown: (_) => _buttonController.reverse(),
                          onTapUp: (_) => _buttonController.forward(),
                          child: ElevatedButton(
                            onPressed: () {}, // Your onPressed logic
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Read More"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
