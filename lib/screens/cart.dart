import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "CART",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          ),
        ),
        backgroundColor: Color(0xFF018ABE),
      ),    );
  }
}