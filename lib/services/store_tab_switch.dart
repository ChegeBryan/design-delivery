import 'package:flutter/material.dart';

class StoreTabSwitch extends ChangeNotifier {
  int currentTab = 0;
  String currentPage = 'products';

  List<String> pageKeys = ['products', 'orders', 'profile'];

  int get getCurrentTab => currentTab;
  String get getCurrentPage => currentPage;

  void switchPage(index) {
    currentPage = pageKeys[index];
    currentTab = index;
    notifyListeners();
  }
}
