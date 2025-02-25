import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String profilePath = 'images/profile.jpg';
  String name = 'Ujjwal';
  String phone = '9877358790';
  String email = 'Ujjwal3@gmail.com';
  String address = 'Mohali';

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        profilePath = pickedFile.path;
      });
    }
  }

  void editProfile() {
    setState(() {
      name = nameController.text;
      phone = phoneController.text;
      email = emailController.text;
      address = addressController.text;
    });
    Navigator.of(context).pop();
  }

  void editOpenProfileDialog() {
    // Set initial values for the text controllers
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
    addressController.text = address;

      showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: profilePath == 'images/profile.jpg'
                      ? AssetImage(profilePath)
                      : FileImage(File(profilePath)) as ImageProvider,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 16,
                      child: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(nameController, "Name", Icons.person),
              _buildTextField(emailController, "Email", Icons.email),
              _buildTextField(phoneController, "Phone", Icons.phone),
              _buildTextField(addressController, "Address", Icons.location_on),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        editProfile();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Save", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.redAccent),
                      ),
                      child: Text("Cancel", style: TextStyle(color: Colors.redAccent)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define padding and radius based on screen width
    double avatarRadius = screenWidth * 0.18;
    double fontSizeTitle = screenWidth * 0.08;
    double fontSizeSubtitle = screenWidth * 0.05;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.8),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.15),
          child: Image.asset(
            'images/baselinelogo.png',
            colorBlendMode: BlendMode.color,
            width: screenWidth * 0.3,
          ),
        ),
      ),
      backgroundColor: Colors.white, // Light background color for the screen

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              GestureDetector(
                onTap: pickImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(avatarRadius),
                  child:
                      profilePath == 'images/profile.jpg'
                          ? Image.asset(
                            'images/profile.jpg',
                            width: avatarRadius * 2,
                            height: avatarRadius * 2,
                            fit: BoxFit.cover,
                          )
                          : Image.file(
                            File(profilePath),
                            width: avatarRadius * 2,
                            height: avatarRadius * 2,
                            fit: BoxFit.cover,
                          ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Ujjwal',
                style: TextStyle(
                  fontSize: fontSizeTitle,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Software Developer',
                style: TextStyle(
                  fontSize: fontSizeSubtitle,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              itemProfile('Name', name, Icons.person),
              SizedBox(height: screenHeight * 0.015),
              itemProfile('Phone', phone, Icons.phone),
              SizedBox(height: screenHeight * 0.015),
              itemProfile('Email', email, Icons.email),
              SizedBox(height: screenHeight * 0.015),
              itemProfile('Address', address, Icons.location_on),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: editOpenProfileDialog,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.red.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemProfile(String title, String subtitle, IconData icondata) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
      leading: Icon(icondata, color: Colors.redAccent),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey[600],
        size: 20,
      ),
    ),
  );
}

Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}