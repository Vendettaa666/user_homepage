import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Halaman Keranjang')),
      body: Center(child: const Text('Konten Halaman Keranjang')),
    );
  }
}