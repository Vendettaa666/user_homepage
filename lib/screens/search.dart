  import 'package:flutter/material.dart';
  import 'package:user_homepage/screens/widget/foodcard.dart';
  import 'package:user_homepage/main.dart';
  import 'package:user_homepage/screens/widget/popupmenu.dart';

  class SearchPage extends StatelessWidget {
    const SearchPage({super.key});

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
              "SEARCH",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
          ),
          actions: [
              CustomPopupMenu(),
        ],          backgroundColor: Color(0xFF018ABE),
        ),
        body: SingleChildScrollView(
          child: Column(
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final Map<String, Map<String, dynamic>> foodItems = {
                    '0': {
                    'path': 'assets/miepedas.jpg', // Perbaikan path gambar
                    'title': 'Mie Pedas',
                    'price': 'Rp 10.000',
                    'description': 'Mie pedas dengan bumbu istimewa' // Deskripsi
                  },
                  '1': {
                    'path': 'assets/soto.jpg', // Perbaikan path gambar
                    'title': 'Soto',
                    'price': 'Rp 10.000',
                    'description': 'Soto ayam yang lezat' // Deskripsi
                  },
                  '2': {
                    'path': 'assets/steak-daging.jpg', // Perbaikan path gambar
                    'title': 'Steak Daging',
                    'price': 'Rp 12.000',
                    'description': 'Steak daging sapi berkualitas' // Deskripsi
                  },
                  '3': {
                    'path': 'assets/sateayam.jpg', // Perbaikan path gambar
                    'title': 'Sate Ayam',
                    'price': 'Rp 15.000',
                    'description': 'Sate ayam dengan bumbu kacang' // Deskripsi
                  },
                  '4': {
                    'path': 'assets/pancake.jpg', // Perbaikan path gambar
                    'title': 'Pancake',
                    'price': 'Rp 25.000',
                    'description': 'Pancake lembut dan lezat' // Deskripsi
                  },
                  '5': {
                    'path': 'assets/essusu.jpeg', // Perbaikan path gambar
                    'title': 'Es Susu',
                    'price': 'Rp 10.000',
                    'description': 'Es susu segar dan nikmat' // Deskripsi
                  },
                  };
                  
                  Map<String, dynamic> item = foodItems[index.toString()]!;
                  return FoodCard(
                    imagePath: item['path'],
                    title: item['title'],
                    price: item['price'],
                    description: item['description'],
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  }