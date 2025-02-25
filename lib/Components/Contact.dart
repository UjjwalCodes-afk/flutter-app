import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:async';


class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  bool isVerified = false;
  bool isSubmitting = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> _sendMessage() async {
  if (!_formKey.currentState!.validate() || !isVerified || isSubmitting) return;

  setState(() => isSubmitting = true);

  final url = "https://nodemailer-api-7jb1.onrender.com/user/contact";
  final requestData = {
    "name": nameController.text.trim(),
    "email": emailController.text.trim(),
    "message": messageController.text.trim(),
  };

  try {
    final encodedData = await compute(jsonEncode, requestData); // Offload JSON parsing
    final response = await http
        .post(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: encodedData)
        .timeout(const Duration(seconds: 10)); // Set timeout

    if (response.statusCode == 200) {
      _showSuccessDialog();
    } else {
      _showErrorSnackBar("Failed to send message. Try again later.");
    }
  } on TimeoutException {
    _showErrorSnackBar("Request timed out. Please try again.");
  } catch (e) {
    _showErrorSnackBar("An error occurred. Please try again.");
  } finally {
    setState(() => isSubmitting = false);
  }
}


  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Message Sent"),
        content: const Text("Your message has been delivered."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              nameController.clear();
              emailController.clear();
              messageController.clear();
              setState(() => isVerified = false);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Contact Us"),
        centerTitle: true,
        backgroundColor: Colors.red.withOpacity(0.8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Get in Touch", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Text("Fill out the form and we’ll be in touch.", style: TextStyle(fontSize: 16, color: Colors.black54)),
                      const SizedBox(height: 20),
                      _buildTextField("Name", Icons.person, nameController),
                      const SizedBox(height: 15),
                      _buildTextField("Email", Icons.email, emailController, isEmail: true),
                      const SizedBox(height: 20),
                      _buildTextField("Message", Icons.message, messageController, isMessage: true),
                      const SizedBox(height: 20),
                      CheckboxListTile(
                        title: const Text("I am not a robot"),
                        value: isVerified,
                        onChanged: (value) => setState(() => isVerified = value!),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isVerified && !isSubmitting ? _sendMessage : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isVerified ? Colors.red : Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: isSubmitting
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                                  "Get free consultation",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget _buildTextField(String label, IconData icon, TextEditingController controller,
    {bool isEmail = false, bool isMessage = false}) {
  return TextFormField(
    controller: controller,
    maxLines: isMessage ? 4 : 1,
    keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
    decoration: InputDecoration(
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.red),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
    validator: (value) {
      if (value == null || value.trim().isEmpty) {
        return "Please enter your $label";
      }
      if (isEmail && !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
        return "Enter a valid email";
      }
      return null;
    },
  );
}
}