import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_homepage/providers/header_title_provider.dart'; // Path yang sesuai
import 'package:user_homepage/widgets/user_header.dart'; // Path yang sesuai

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("HOME", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
              ),        
              backgroundColor: Color(0xFF018ABE),
        ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF018ABE)
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
            },
            child: Text('Go to Info Page', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      
    );
  }
}