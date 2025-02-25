import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String longText;
  const CustomListTile({super.key, required this.imagePath, required this.title, required this.subtitle, required this.longText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imagePath, height: 60,width: 60,),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle, style: TextStyle(color: Colors.grey.shade700, fontSize: 14),),
          SizedBox(height: 5,),
          Text(longText, style: TextStyle(color: Colors.black87, fontSize: 14), softWrap: true,)
        ],
      ),
      isThreeLine: true,
    );
  }
}