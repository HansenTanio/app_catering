import 'package:cateringapp/backend/Provider/MenuProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../backend/data/Menu.dart';
import 'KotakMenu1.dart';
import '../../backend/data/Database.dart';

class reguler extends StatelessWidget {
  const reguler({super.key});

  @override
  Widget build(BuildContext context) {
    MenuProvider menuProvider = Provider.of<MenuProvider>(context);
    List<Menu> listMenu = menuProvider.getMenu;
    // print(listMenu.data);
    List<Widget> regulerList = [];
    DBHelper _dbHelper = DBHelper();

    // for (List<Datum> datum in listMenu) {
    //   regulerList.add(KotakMenu1(menu: datum, index: 1));
    // }

    return Row(
      children: regulerList,
    );
  }
}
