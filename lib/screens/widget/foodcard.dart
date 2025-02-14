import 'package:flutter/material.dart';
import 'package:user_homepage/screens/infoproduct.dart';


class FoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String description; // Tambahkan ini

  const FoodCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description, // Tambahkan ini di konstruktor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => InfoProduct(
      imagePath: imagePath,
      title: title,
      price: price,
      description: description,
    ),
  ),
);
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk menambahkan ke keranjang
                        },
                        child: const Text('Add To Cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}