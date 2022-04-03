import 'package:corona_news/theme/main_theme.dart';
import 'package:corona_news/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_country.dart';

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
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ThemeLight.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomViewCountry(themeData: themeData),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'آیا حس بیماری دارید ؟',
                      style: themeData.textTheme.headline6!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'اگر با هر یک از علائم کووید-19 احساس بیماری می‌کنید، لطفاً فوراً برای کمک با ما تماس بگیرید یا پیامک کنید.',
                      style: themeData.textTheme.bodyText2!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonHome(
                            themeData: themeData,
                            icon: CupertinoIcons.phone,
                            title: 'تماس',
                            onTap: () {}),
                        ButtonHome(
                            themeData: themeData,
                            icon: CupertinoIcons.mail,
                            title: 'پیام ',
                            onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('نکات بهداشتی ', style: themeData.textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
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

class ButtonHome extends StatelessWidget {
  String title;
  IconData icon;
  final Function() onTap;
  ButtonHome({
    required this.icon,
    required this.onTap,
    required this.title,
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: MaterialButton(
        onPressed: onTap,
        minWidth: 130,
        height: 50,
        color: ThemeLight.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: ThemeLight.primaryColor,
              size: 22,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: themeData.textTheme.bodyText2!.copyWith(
                  color: ThemeLight.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
