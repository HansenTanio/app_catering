import 'package:flutter/material.dart';
import 'package:cateringapp/backend/data/Menu.dart';

class MenuProvider extends ChangeNotifier {
  List<Menu> _menu = [];
  List<Menu> get getMenu => _menu;
  set setMenu(value) {
    _menu = value;
    notifyListeners();
  }
}
