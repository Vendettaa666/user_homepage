import 'package:flutter/material.dart';
import 'package:user_homepage/screens/widget/foodcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018ABE),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("HOME",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        backgroundColor: const Color(0xFF018ABE),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      '../assets/steak.jpg',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 14,
                    left: 14,
                    child: Text(
                      'RECOMENDED',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Jenis Item:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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