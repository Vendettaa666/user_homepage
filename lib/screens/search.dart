  import 'package:flutter/material.dart';
  import 'package:user_homepage/screens/widget/foodcard.dart';
  import 'package:user_homepage/main.dart';

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
              PopupMenuButton<String>(
                icon: Icon(Icons.menu, color: Colors.white),
                offset: Offset(0, 40),
                onSelected: (value) {
                  // Lakukan sesuatu berdasarkan pilihan
                  print(value);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 'group',
                      child: ListTile(
                        leading: Icon(Icons.group),
                        title: Text('Grup baru'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'broadcast',
                      child: ListTile(
                        leading: Icon(Icons.campaign),
                        title: Text('Siaran baru'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'linked_devices',
                      child: ListTile(
                        leading: Icon(Icons.devices),
                        title: Text('Perangkat tertaut'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'starred_messages',
                      child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text('Pesan berbintang'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'settings',
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Setelan'),
                      ),
                    ),
                  ];
                },
              ),
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
                      'path': '../assets/miepedas.jpg',
                      'title': 'Mie Pedas',
                      'price': 'Rp 10.000'
                    },
                    '1': {
                      'path': '../assets/soto.jpg',
                      'title': 'Soto',
                      'price': 'Rp 10.000'
                    },
                    '2': {
                      'path': '../assets/steak-daging.jpg',
                      'title': 'Steak Daging',
                      'price': 'Rp 12.000'
                    },
                    '3': {
                      'path': '../assets/sateayam.jpg',
                      'title': 'Sate Ayam',
                      'price': 'Rp 15.000'
                    },
                    '4': {
                      'path': '../assets/pancake.jpg',
                      'title': 'Pancake',
                      'price': 'Rp 25.000'
                    },
                    '5': {
                      'path': '../assets/essusu.jpeg',
                      'title': 'Es Susu',
                      'price': 'Rp 10.000'
                    },
                  };
                  
                  Map<String, dynamic> item = foodItems[index.toString()]!;
                  return FoodCard(
                    imagePath: item['path'],
                    title: item['title'],
                    price: item['price'],
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  }