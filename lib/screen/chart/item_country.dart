import 'package:corona_news/data/corona.dart';
import 'package:flutter/material.dart';

import '../../contanse/main_theme.dart';

class ItemCountry extends StatelessWidget {
  Result coronaEntity;
  ItemCountry({
    Key? key,
    required this.coronaEntity,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin:
                const EdgeInsets.only(left: 0, right: 8, bottom: 12, top: 8),
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'جمعیت کشور',
                  style: themeData.textTheme.headline6!.copyWith(
                    color: ThemeLight.primaryColor,
                    fontSize: 22,
                  ),
                ),
                Text(
                  coronaEntity.cases!,
                  style: themeData.textTheme.headline6!.copyWith(fontSize: 32),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                Text(
                  'کشور شما',
                  style: themeData.textTheme.headline6!
                      .copyWith(color: ThemeLight.primaryColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(40), blurRadius: 10)
                      ]),
                      child: Image.asset(
                        'assets/icon/ic_iran.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      coronaEntity.country!,
                      style: themeData.textTheme.headline6,
                    ),
                  ],
                ),
                Text(
                  'کد کشور',
                  style: themeData.textTheme.headline6!
                      .copyWith(color: ThemeLight.primaryColor),
                ),
                Text(
                  "98",
                  style: themeData.textTheme.headline6,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
