import 'package:flutter/material.dart';
import 'package:user_homepage/widgets/user_navbar.dart';
import 'providers/header_title_provider.dart'; 
import 'package:provider/provider.dart';

void main() {
  runApp(const UserHomepage());
}

class UserHomepage extends StatelessWidget {
  const UserHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => HeaderTitleProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const UserNavbar(),
      ),
    );
  }
}