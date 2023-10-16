import 'package:cateringapp/backend/Provider/MenuProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../backend/data/Menu.dart'; // Assuming this imports your data source
import 'KotakMenu1.dart';
import '../../backend/data/Database.dart'; // Import your DBHelper class

class reguler extends StatelessWidget {
  const reguler({super.key});

  @override
  Widget build(BuildContext context) {
    MenuProvider menuProvider = Provider.of<MenuProvider>(context);
    List<Menu> menuList = menuProvider.getMenu;
    List<Widget> regulerList = [];
    DBHelper _dbHelper = DBHelper();

    for (Menu menu in menuList) {
      regulerList.add(KotakMenu1(menu: menu));
    }

    return Row(
      children: regulerList,
    );
  }
}
