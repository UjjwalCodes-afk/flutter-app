import 'package:baseline/Components/Custom/CustomDrawer.dart';
import 'package:baseline/Components/Custom/CustomListTile.dart';
import 'package:baseline/Components/ProfilePage.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
 

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> imagePaths = [
    "images/baseline4.jpg",
    "images/baseline1.png",
    "images/baseline2.png",
    "images/baseline3.png",
  ];
  bool imagesPreLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(!imagesPreLoaded){
    preLoadImages();
    imagesPreLoaded = true; 
    }
  }
  void preLoadImages(){
    for(String imagePath in imagePaths){
      precacheImage(AssetImage(imagePath), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: Image.asset(
                  'images/baselinelogo.png',
                  width: screenWidth * 0.3,
                  colorBlendMode: BlendMode.color,
                ),
              ),
            ),
            
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: screenWidth * 0.07,
              ), // Responsive icon size
              onPressed: () {
                print("Profile Icon Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfile()),
                );
              },
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),

      drawer: customDrawer(context),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),

              /// **Carousel Slider**
              CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight * 0.25,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.85,
                ),
                items:
                    imagePaths.map((imagePath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
              ),
              SizedBox(height: screenHeight * 0.03),

              /// **Website Development Process Box**
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.03,
                    horizontal: screenWidth * 0.07,
                  ),
                  child: Center(
                    child: Text(
                      "Our Website Development Process",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              /// **Services Section (Horizontal Scroll)**
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildServiceColumn(
                      screenWidth,
                      'images/work.png',
                      'Design and Wireframing',
                    ),
                    buildServiceColumn(
                      screenWidth,
                      'images/work1.png',
                      'Content Creation',
                    ),
                    buildServiceColumn(
                      screenWidth,
                      'images/work2.png',
                      'Development and Coding',
                    ),
                    buildServiceColumn(
                      screenWidth,
                      'images/work3.png',
                      'Testing and Quality Assurance',
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              /// **Trusted Web Design Partner Box**
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Your Trusted Web Design Partner in India",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Image.asset(
                      'images/baseline3.png',
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              /// **Why Choose Us Section**
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    Text(
                      "Why Choose Us for Web Design?",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    buildServiceSection(
                      Icons.design_services,
                      "Custom Web Design",
                      "We create tailored designs that represent your brand and meet your business goals.",
                    ),
                    buildServiceSection(
                      Icons.devices,
                      "Responsive Web Design",
                      "We ensure your website adapts perfectly to all screen sizes.",
                    ),
                    buildServiceSection(
                      Icons.web,
                      "Landing Page Design",
                      "We design high-converting landing pages optimized for lead generation.",
                    ),
                    buildServiceSection(
                      Icons.emoji_objects,
                      "UI/UX Design",
                      "Our experts focus on intuitive and user-friendly designs.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              /// **Services We Provide Section**
              Text(
                "The Services We Provide",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildServiceColumn(
                      screenWidth,
                      'images/services1.jpg',
                      'App Development',
                    ),
                    buildServiceColumn(
                      screenWidth,
                      'images/services2.jpg',
                      'Software Development',
                    ),
                    buildServiceColumn(
                      screenWidth,
                      'images/service4.jpg',
                      'ChatBot Development',
                    ),
                    buildServiceColumn(
                      screenWidth,
                      'images/service5.jpg',
                      'Web Designing',
                    ),
                    buildServiceColumn(
                      screenWidth,
                      'images/service6.jpg',
                      'Ecommerce Design',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "See What Our Clients Say About Us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 21,
                ),
              ),
              CustomListTile(
                imagePath: 'images/client1.png',
                title: 'Liam',
                subtitle: 'Chief Officer',
                longText:
                    'The team at Baseline IT Development was instrumental in launching our new e-commerce platform. Their attention to detail and ability to meet tight deadlines were impressive. Our sales have skyrocketed since the launch',
              ),
              CustomListTile(
                imagePath: 'images/client2.png',
                title: 'Olivia F',
                subtitle: 'Product Director',
                longText:
                    'Partnering with Baseline IT Development was a great decision. They took our complex requirements and transformed them into a powerful web application using React and Node. Their team’s professionalism and innovation were truly impressive.',
              ),
              CustomListTile(
                imagePath: 'images/client3.png',
                title: 'Ethan C',
                subtitle: 'Founder & CEO',
                longText:
                    'Baseline IT Development is a true partner in our digital journey. Their innovative solutions and commitment to excellence have made a significant impact on our operations. We look forward to continuing our collaboration in the future!',
              ),
              CustomListTile(
                imagePath: 'images/client4.png',
                title: 'Sophia T.',
                subtitle: 'Head of Digital Strategy',
                longText:
                    'Working with Baseline IT Development has been a fantastic experience. They not only delivered a high-quality website but also provided valuable insights into digital marketing strategies that helped us grow our online traffic significantly.',
              ),
              CustomListTile(
                imagePath: 'images/client5.png',
                title: 'Grace B.',
                subtitle: 'Technical Lead',
                longText:
                    'I was impressed with the professionalism and expertise of the Baseline team. They guided us through the entire web development process, and the final product is both user-friendly and visually appealing. Thank you for your hard work!',
              ),
              CustomListTile(
                imagePath: 'images/client6.png',
                title: 'James W.',
                subtitle: 'Senior Product Manager',
                longText:
                    'We’re incredibly impressed with Baseline IT Development. Their team took our idea and brought it to life using React and Node. The web app is fast, efficient, and easy to manage — the perfect solution for our business. highly recommended',
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08,
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/background.png',), fit: BoxFit.cover),
                  color: Colors.purple.shade900,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple,
                      blurRadius: 3,
                      offset: Offset(2, 3),
                    ),
                  ],
                  backgroundBlendMode: BlendMode.hardLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Why Choose Baseline IT Development?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          letterSpacing: 4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Text(
                        "At Baseline IT Development, we’re more than just a service provider—we’re your partner in success. Our approach is simple: we take the time to understand your unique challenges and goals, ensuring that every solution we create is customized specifically to your needs. Whether it’s web development, app creation, or digital marketing, we combine creativity and technology to deliver results that make an impact.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          height: 1.6,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Your Success is Our Mission",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          letterSpacing: 4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Text(
                        "What makes us different is our dedication to building genuine, long-term relationships. We don’t just develop projects; we collaborate closely with you at every stage, providing transparency and open communication so you always feel supported. Our team thrives on innovation, constantly pushing the boundaries to bring you the latest technologies and the most effective strategies. At the heart of our work is a passion for helping businesses grow. When you succeed, we succeed. That’s why we focus not only on delivering top-quality solutions but also on making sure they drive real, measurable results for your business.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          height: 1.6,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildServiceColumn(double screenWidth, String imagePath, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Container(
        width: screenWidth * 0.35,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: screenWidth * 0.2,
              width: screenWidth * 0.2,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            FittedBox(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildServiceSection(IconData icon, String title, String description) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 30, color: Colors.red),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
