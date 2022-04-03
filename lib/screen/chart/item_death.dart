import 'package:corona_news/data/corona.dart';
import 'package:flutter/material.dart';

import '../../contanse/main_theme.dart';

class DeathItem extends StatelessWidget {
  Result corona;
  DeathItem({
    Key? key,
    required this.corona,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Container(
        margin: EdgeInsets.only(left: 12, right: 12),
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(200),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Positioned(
                  left: 2,
                  bottom: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/images/ic_face_black.png',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/ic_face_white.png',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'افراد فوت شده امروز',
                  style: themeData.textTheme.headline6!
                      .copyWith(color: ThemeLight.primaryColor),
                ),
                Text(
                  corona.deaths!,
                  style: themeData.textTheme.headline6!.copyWith(fontSize: 32),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
