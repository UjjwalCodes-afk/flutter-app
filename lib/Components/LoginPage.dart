import 'package:baseline/Components/Clipper/clipper.dart';
import 'package:baseline/Components/HomePage.dart';
import 'package:baseline/Components/Register.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 600 ? 50.0 : 20.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(screenWidth, 280),
                  painter: RPSCustomPainter(),
                ),
                Positioned(
                  top: 16,
                  right: -5,
                  child: CustomPaint(
                    size: Size(screenWidth, 280),
                    painter: RPSCustomPainter(),
                  ),
                ),
                Positioned(
                  top: 160,
                  child: Image.asset(
                    'images/baselinelogo.png',
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(height: 5),
            Text(
              "Please login to your account to continue",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputField(emailController, Icons.email, "Enter your email"),
                  const SizedBox(height: 15),
                  _buildInputField(passController, Icons.lock, "Enter your password", isPassword: true),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 90),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                      ),
                      child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Don't have an account?", style: TextStyle(color: Colors.black, fontSize: 17)),
                    WidgetSpan(child: SizedBox(width: 7)),
                    TextSpan(text: "Register", style: TextStyle(color: Colors.blue, fontSize: 17, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, IconData icon, String hint, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Ensuring visibility
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(offset: Offset(1, 3), blurRadius: 2, color: Colors.grey.shade300)],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 10),
          prefixIcon: Icon(icon),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey), // Ensuring hint visibility
        ),
        style: TextStyle(color: Colors.black), // Ensuring input text visibility
      ),
    );
  }
}