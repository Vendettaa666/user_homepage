  import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Halaman Riwayat')),
      body: Center(child: const Text('Konten Halaman Riwayat')),
    );
  }
}