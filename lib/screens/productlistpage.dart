import 'package:flutter/material.dart';
import 'package:user_homepage/screens/widget/foodcard.dart';
import 'package:user_homepage/screens/cart.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Map<String, dynamic>> cartItems = []; // Inisialisasi cartItems

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        actions: [
          IconButton(
            onPressed: () async {
              final updatedCartItems = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cartItems),
                ),
              );

              if (updatedCartItems != null) {
                setState(() {
                  cartItems = updatedCartItems as List<Map<String, dynamic>>;
                });
              }
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 6, // Ganti dengan jumlah produk Anda
        itemBuilder: (context, index) {
          final Map<String, Map<String, dynamic>> foodItems = {
            // ... (data foodItems Anda dengan path gambar yang BENAR)
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
    );
  }
}