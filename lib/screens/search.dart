  import 'package:flutter/material.dart';

  class SearchPage extends StatelessWidget {
    const SearchPage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Halaman Pencarian')),
        body: const Center(child: Text('Konten Halaman Pencarian')),
      );
    }
  }