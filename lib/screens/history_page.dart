  import 'package:flutter/material.dart';
  import 'package:user_homepage/main.dart';
  import 'package:user_homepage/screens/widget/popupmenu.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF018ABE),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserHomepage()),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          "HISTORY",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
        ),
        actions: [
              CustomPopupMenu(),
        ],
        backgroundColor: Color.fromRGBO(1, 138, 190, 1),
      ),
    );
  }
}