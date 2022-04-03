import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../contanse/main_theme.dart';
import '../../widgets/custom_country.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style:
                  themeData.textTheme.headline6!.copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'اگر با هر یک از علائم کووید-19 احساس بیماری می‌کنید، لطفاً فوراً برای کمک با ما تماس بگیرید یا پیامک کنید.',
              style:
                  themeData.textTheme.bodyText2!.copyWith(color: Colors.white),
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
