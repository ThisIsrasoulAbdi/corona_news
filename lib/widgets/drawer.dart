import 'package:corona_news/screen/about/about.dart';
import 'package:corona_news/widgets/image_catched.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contanse/main_theme.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Drawer(
      elevation: 0,
      backgroundColor: ThemeLight.colorWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(54),
          bottomLeft: Radius.circular(54),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 64, 8, 12),
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ImageNetwork(
                            urlImage:
                                "https://www.faceapp.com/static/img/content/compare/old-example-before@3x.jpg"),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 5,
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10,
                            )
                          ], color: Colors.green, shape: BoxShape.circle),
                          child: const Icon(
                            CupertinoIcons.pen,
                            color: Colors.white,
                            size: 25,
                          ),
                        )),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    child: Text(
                      'علیرضا داودی',
                      style: themeData.textTheme.headline6!.copyWith(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ItemMenu(
                    themeData: themeData,
                    iconData: CupertinoIcons.home,
                    menuSelected: () {},
                    title: "خانه",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemMenu(
                    themeData: themeData,
                    iconData: CupertinoIcons.news,
                    menuSelected: () {},
                    title: "اخبار روز",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemMenu(
                    themeData: themeData,
                    iconData: CupertinoIcons.info,
                    menuSelected: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ),
                      );
                    },
                    title: "درباره ما",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemMenu(
                    themeData: themeData,
                    iconData: CupertinoIcons.phone,
                    menuSelected: () {},
                    title: "تماس با ما",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemMenu(
                    themeData: themeData,
                    iconData: CupertinoIcons.chart_bar_square,
                    menuSelected: () {},
                    title: "چارت کرونا",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemMenu(
                    themeData: themeData,
                    iconData: CupertinoIcons.person_crop_square,
                    menuSelected: () {},
                    title: "حساب کاربری",
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade300),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: Text(
                      'خروج از حساب کاربری',
                      style: themeData.textTheme.headline6!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  String title;
  IconData iconData;
  Function() menuSelected;
  ItemMenu({
    required this.iconData,
    required this.menuSelected,
    required this.title,
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: menuSelected,
      borderRadius: BorderRadius.circular(22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.black,
            size: 22,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(title,
                style: themeData.textTheme.headline6!
                    .copyWith(fontWeight: FontWeight.normal)),
          ),
          const Icon(
            Icons.keyboard_arrow_left_sharp,
            color: Colors.black,
            size: 32,
          ),
        ],
      ),
    );
  }
}
