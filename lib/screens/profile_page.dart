import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Halaman Profile')),
      body: Center(child: const Text('Konten Halaman Profile')),
    );
  }
}