import 'package:corona_news/contanse/main_theme.dart';
import 'package:corona_news/screen/about/about.dart';
import 'package:corona_news/screen/chart/chart.dart';
import 'package:corona_news/screen/home/home_page.dart';
import 'package:corona_news/screen/news/news.dart';
import 'package:corona_news/screen/onboarding/onboardign_page.dart';
import 'package:corona_news/widgets/appbar.dart';
import 'package:corona_news/widgets/bottom_nav.dart';
import 'package:corona_news/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const defultFontFamily = "IranYekan";
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        colorScheme: ColorScheme.light(
          primary: ThemeLight.primaryColor,
          secondary: ThemeLight.secodreyColor,
          onSecondary: ThemeLight.colorWhite,
        ),
        iconTheme: IconThemeData(color: ThemeLight.colorWhite, size: 42),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: defultFontFamily,
            color: ThemeLight.primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
          caption: const TextStyle(fontFamily: defultFontFamily),
          bodyText2: const TextStyle(
              fontFamily: defultFontFamily, fontWeight: FontWeight.normal),
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: OnBoardingScreen(),
      ),
    );
  }
}

const int homeScreenIndex = 0;
const int newsScreenIndex = 1;
const int chartScreenIndex = 2;
const int aboutScreenIndex = 3;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexCurrent = homeScreenIndex;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: CustomAppBar(themeData: themeData),
          iconTheme: const IconThemeData(size: 28),
        ),
        drawer: const DrawerCustom(),
        drawerScrimColor: ThemeLight.primaryColor.withAlpha(98),
        body: IndexedStack(
          index: indexCurrent,
          children: const [
            HomeScreen(),
            NewsScreen(),
            ChartScreen(),
            AboutScreen(),
          ],
        ),
        bottomNavigationBar: CurvedBottomNav(
          selected: indexCurrent,
          isSelected: (int index) {
            setState(() {
              indexCurrent = index;
            });
          },
        ),
      ),
    );
  }
}
