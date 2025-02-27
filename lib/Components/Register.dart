import 'dart:convert';
import 'package:baseline/Components/HomePage.dart';
import 'package:baseline/Components/LoginPage.dart';
import 'package:baseline/Components/clipper/clipper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  Future<void> registerUser() async {
    final String apiUrl = "http://localhost:9090/auth/register";
    if (!mounted) return;
    setState(() => isLoading = true);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passController.text,
          "confirmPassword": confirmPassController.text,
        }),
      );

      if (!mounted) return;
      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.statusCode == 200 ? "Registration Successful!" : "Registration Failed! ${response.body}")),
      );

      if (response.statusCode == 200) {
        Future.delayed(Duration(seconds: 1), () {
          if (mounted) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred. Please try again.")),
      );
    }
  }

  Widget buildTextField({required TextEditingController controller, required String hintText, required IconData icon, bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(offset: Offset(1, 3), blurRadius: 2, color: Colors.grey.shade300)],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          hintText: hintText,
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double formWidth = constraints.maxWidth > 600 ? 400 : constraints.maxWidth * 0.85;
            return Column(
              children: [
                Stack(
                  children: [
                    CustomPaint(size: Size(MediaQuery.of(context).size.width, 300), painter: RPSCustomPainter()),
                    Positioned(
                      top: 130,
                      left: MediaQuery.of(context).size.width / 2 - 65,
                      child: Image.asset('images/baselinelogo.png', width: 130, fit: BoxFit.contain),
                    ),
                    Positioned(
                      top: 200,
                      left: MediaQuery.of(context).size.width * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                          SizedBox(height: 10),
                          Text("Please create an account to continue", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: SizedBox(
                      width: formWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          buildTextField(controller: nameController, hintText: "Enter your name", icon: Icons.person),
                          SizedBox(height: 20),
                          buildTextField(controller: emailController, hintText: "Enter your email", icon: Icons.email),
                          SizedBox(height: 20),
                          buildTextField(controller: passController, hintText: "Enter your password", icon: Icons.lock, obscureText: true),
                          SizedBox(height: 20),
                          buildTextField(controller: confirmPassController, hintText: "Confirm your password", icon: Icons.lock, obscureText: true),
                          SizedBox(height: 30),
                          Center(
                            child: ElevatedButton(
                              onPressed: isLoading ? null : registerUser,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                elevation: 5,
                                shadowColor: Colors.blue.withOpacity(0.4),
                                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              child: isLoading
                                  ? CircularProgressIndicator(color: Colors.white)
                                  : Text("Register", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: InkWell(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Already have an account?", style: TextStyle(color: Colors.black, fontSize: 17)),
                                    WidgetSpan(child: SizedBox(width: 7)),
                                    TextSpan(text: "Login", style: TextStyle(color: Colors.blue, fontSize: 17, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}