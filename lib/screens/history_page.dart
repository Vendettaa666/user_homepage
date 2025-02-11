  import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "HISTORY",
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