import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_homepage/providers/header_title_provider.dart'; // Path yang sesuai

class UserHeader extends StatelessWidget implements PreferredSizeWidget {
  const UserHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Ukuran AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Consumer<HeaderTitleProvider>(
        builder: (context, headerTitleProvider, _) {
          return Text(headerTitleProvider.title);
        },
      ),
      // ... tambahkan properti AppBar lainnya di sini
    );
  }
}