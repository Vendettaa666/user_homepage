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

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: NavigationBar(
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.blue.withOpacity(0.5),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "home",
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              selectedIcon: Icon(Icons.shopping_cart),
              label: "cart",
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: "search",
            ),
            NavigationDestination(
              icon: Icon(Icons.history_outlined),
              selectedIcon: Icon(Icons.history),
              label: "history",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: "profile",
            ),
          ],
        ),
      ),
    );
  }
}