import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/main_theme.dart';

class CustomViewCountry extends StatelessWidget {
  const CustomViewCountry({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'اخبار کرونا ویروس ',
          style: themeData.textTheme.headline6!.apply(color: Colors.white),
        ),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: const Color(0xff155D19),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: ThemeLight.colorWhite,
                  size: 22,
                ),
                Text(
                  'Iran',
                  style: themeData.textTheme.headline6!
                      .copyWith(fontSize: 18, color: ThemeLight.colorWhite),
                ),
                Image.asset(
                  'assets/icon/ic_iran.png',
                  width: 18,
                  height: 18,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
