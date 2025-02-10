import 'package:flutter/material.dart';
import 'package:user_homepage/screens/home_page.dart';
import 'package:user_homepage/screens/history_page.dart';
import 'package:user_homepage/screens/cart.dart';
import 'package:user_homepage/screens/search.dart';
import 'package:user_homepage/screens/profile_page.dart';

class UserNavbar extends StatefulWidget {
  const UserNavbar({super.key});

  @override
  State<UserNavbar> createState() => UserNavbarState();
}

class UserNavbarState extends State<UserNavbar> {
  int currentPageIndex = 0;

  // Menambahkan properti untuk mengontrol visibilitas FAB
  bool showFab = false;

  @override
  void initState() {
    super.initState();
    // Set FAB visible saat pertama kali masuk ke home
    showFab = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const HomePage(),
        const CartPage(),
        const SearchPage(),
        const HistoryPage(),
        const ProfilePage(),
      ][currentPageIndex],
      
      // Tambahkan kondisi untuk menampilkan FAB hanya di halaman home
      floatingActionButton: showFab 
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('News Alert'),
                      content: const Text('Welcome to our News App!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add_alert),
            )
          : null,

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            // Update visibility FAB berdasarkan halaman yang dipilih
            showFab = index == 0;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: "cart"),
          NavigationDestination(icon: Icon(Icons.search), label: "search"),
          NavigationDestination(icon: Icon(Icons.history), label: "history"),
          NavigationDestination(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
    );
  }
}