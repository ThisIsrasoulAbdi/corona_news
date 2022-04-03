import 'package:corona_news/main.dart';
import 'package:corona_news/screen/about/about.dart';
import 'package:corona_news/screen/chart/chart.dart';
import 'package:corona_news/screen/home/home_page.dart';
import 'package:corona_news/screen/news/news.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contanse/main_theme.dart';

class CurvedBottomNav extends StatefulWidget {
  Function(int selected) isSelected;
  int selected;
  CurvedBottomNav({
    Key? key,
    required this.selected,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<CurvedBottomNav> createState() => _CurvedBottomNavState();
}

class _CurvedBottomNavState extends State<CurvedBottomNav> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: ThemeLight.primaryColor,
      height: 44.5,
      index: widget.selected,
      items: [
        ItemNav(
            iconData: Icons.home_outlined,
            onTap: () {
              widget.isSelected(homeScreenIndex);
            }),
        ItemNav(
            iconData: Icons.newspaper_outlined,
            onTap: () {
              widget.isSelected(newsScreenIndex);
            }),
        ItemNav(
            iconData: Icons.bar_chart_sharp,
            onTap: () {
              widget.isSelected(chartScreenIndex);
            }),
        ItemNav(
            iconData: Icons.info_outline,
            onTap: () {
              widget.isSelected(aboutScreenIndex);
            }),
      ],
      onTap: widget.isSelected,
    );
  }
}

// ignore: must_be_immutable
class ItemNav extends StatelessWidget {
  Function() onTap;
  IconData iconData;

  ItemNav({
    required this.onTap,
    Key? key,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(iconData, size: 30, color: ThemeLight.primaryColor),
    );
  }
}
