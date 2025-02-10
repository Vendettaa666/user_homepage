import 'package:flutter/material.dart';

class HeaderTitleProvider with ChangeNotifier {
  String _title = 'Home'; // Judul awal

  String get title => _title;

  void setTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}