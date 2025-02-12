  import 'package:flutter/material.dart';
  import 'package:user_homepage/screens/widget/foodcard.dart';

  class SearchPage extends StatelessWidget {
    const SearchPage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFF018ABE),
        appBar: AppBar(
          title: Center(
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return FoodCard(
                    imagePath: index == 0 ? 'assets/miepedas.jpg' : 'assets/soto.jpg',
                    title: index == 0 ? 'Mie Pedas' : 'Soto',
                    price: 'Rp 10.000',
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }