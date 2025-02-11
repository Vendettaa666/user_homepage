  import 'package:flutter/material.dart';

  class SearchPage extends StatelessWidget {
    const SearchPage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Center(
          child: Text(
            "SEARCH",
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