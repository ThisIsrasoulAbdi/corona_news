import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 85),
        child: Stack(
          children: [
            const Icon(
              Icons.notifications_none,
              size: 32,
            ),
            Positioned(
              right: 0,
              bottom: 4,
              child: Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                  color: Colors.red.shade500,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(30),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '3',
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyText2!
                      .copyWith(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
