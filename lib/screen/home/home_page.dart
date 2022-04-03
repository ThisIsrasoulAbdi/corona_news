import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../contanse/main_theme.dart';
import 'info_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: key,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoItem(themeData: themeData),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('نکات بهداشتی ', style: themeData.textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemHeadlts(
                    title: "ماسک صورت ",
                    nameImagePath: "healts_1.png",
                  ),
                  ItemHeadlts(
                    title: "شستن دست ها",
                    nameImagePath: "healts_3.png",
                  ),
                  ItemHeadlts(
                    title: "فاصله خود را \n رعایت کنید",
                    nameImagePath: "healts_2.png",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'اخبار داغ',
                style: themeData.textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemHeadlts extends StatelessWidget {
  String nameImagePath;
  String title;
  ItemHeadlts({
    Key? key,
    required this.title,
    required this.nameImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/${nameImagePath}'),
        Text(title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: ThemeLight.primaryColor,
                  fontWeight: FontWeight.bold,
                )),
      ],
    );
  }
}
