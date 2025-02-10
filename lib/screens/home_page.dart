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
        title: Text("HOME"),
        backgroundColor: Colors.blue,
        ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Contoh navigasi dan perubahan judul
            Navigator.pushNamed(context, '/info'); // Ganti dengan route yang sesuai
            Provider.of<HeaderTitleProvider>(context, listen: false).setTitle('Info');
          },
          child: const Text('Go to Info Page'),
        ),
      ),
      
    );
  }
}
