import 'package:flutter/material.dart';
import '../data/data.dart';
import 'KotakMenu1.dart';

Widget reguler() {
  List<Widget> regulerList = [];
  for (Menu menu in daftarMenu) {
    regulerList.add(KotakMenu1(menu: menu));
  }
  return Row(
    children: regulerList,
  );
}
