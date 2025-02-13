import 'package:flutter/material.dart';
import 'package:user_homepage/main.dart';
import 'package:collection/collection.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>>? cartItems;

  const CartPage({Key? key, this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018ABE),
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
        title: const Text(
          " CART",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.white),
            offset: const Offset(0, 40),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                // ... (item menu)
              ];
            },
          ),
        ],
        backgroundColor: const Color(0xFF018ABE),
      ),
      body: _buildCartContent(), // Gunakan method terpisah untuk konten body
    );
  }

  Widget _buildCartContent() {
    if (cartItems == null || cartItems!.isEmpty) {
      return const Center(
        child: Text(
          "Tidak ada pesanan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      );
    } else {
      return _buildCartItemsList();
    }
  }


  Widget _buildCartItemsList() {
    Map<String, List<Map<String, dynamic>>> groupedItems =
        cartItems!.groupListsBy((item) => item['title']);

    return ListView.builder(
      itemCount: groupedItems.length,
      itemBuilder: (context, index) {
        final title = groupedItems.keys.elementAt(index);
        final items = groupedItems[title]!;
        final count = items.length;
        final item = items.first;

        return ListTile(
          leading: Image.asset(
            item['path'],
            width: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, object, stackTrace) {
              return const Icon(Icons.error); // Tampilkan icon error jika gambar tidak ditemukan
            },
          ),
          title: Text(title),
          subtitle: Text('${item['price']} x $count'),
        );
      },
    );
  }
}