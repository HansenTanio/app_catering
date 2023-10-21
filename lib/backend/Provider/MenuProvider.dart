// import 'package:flutter/material.dart';
// import 'package:cateringapp/backend/data/Menu.dart';

// class MenuProvider extends ChangeNotifier {
//   List<Datum> lst = [];
//   Menu _menu = Menu(data: lst);
//   Menu get getMenu => _menu;
//   set setMenu(value) {
//     _menu = value;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:cateringapp/backend/data/Menu.dart';

class MenuProvider extends ChangeNotifier {
  List<Menu> lst = [];
  List<Menu> get getMenu => lst;

  set setMenu(value) {
    lst = value;
    notifyListeners();
  }
}
