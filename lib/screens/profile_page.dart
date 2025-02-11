import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF018ABE),
      appBar: AppBar(title: Center(
          child: Text(
            "PROFILE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          ),
        ),
        backgroundColor: Color(0xFF018ABE),
      ),
    );
  }
}