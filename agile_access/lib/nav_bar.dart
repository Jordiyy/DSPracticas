import 'package:agile_access/main.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';

class NavBar {
  late BottomNavigationBar bar;
  final Function(int) ItemNavSelected;

  NavBar({required this.ItemNavSelected}) {
    bar = BottomNavigationBar(
      backgroundColor: AgileAccessColors.azul3,
      items: const [
        BottomNavigationBarItem(
            icon: Iconify(MaterialSymbols.home_outline), label: 'Home'),
        BottomNavigationBarItem(
            icon: Iconify(Mdi.clock_time_four_outline), label: 'Last Visited'),
        BottomNavigationBarItem(icon: Iconify(Ph.user_circle), label: 'User'),
      ],
      onTap: ItemNavSelected,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
