import 'package:corona_news/data/data_static/data_onboarding.dart';
import 'package:corona_news/screen/home/home_page.dart';
import 'package:corona_news/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();

  int page = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page!.round() != page) {
        setState(() {
          page = controller.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var dataOnBoardMessage = DataOnBoarding.message;
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/item2_onboarding.png',
                  width: double.infinity,
                  height: 300,
                ),
                Container(
                  height: 490,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(54),
                        topRight: Radius.circular(54),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 20,
                          spreadRadius: 0.5,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 64),
                        width: 300,
                        height: 250,
                        child: PageView.builder(
                            itemCount: 3,
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Builder(builder: (context) {
                                return SizedBox(
                                  height: 250,
                                  width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      dataOnBoardMessage[index].message,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                      style: themeData.textTheme.headline6!
                                          .copyWith(fontSize: 18),
                                    ),
                                  ),
                                );
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ));
                              },
                              child: Text(
                                'رد شدن',
                                style: themeData.textTheme.headline6,
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('${page - 0}',
                                        style: themeData.textTheme.headline6),
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      height: 20,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade600,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Text(
                                      '$page',
                                      style: themeData.textTheme.headline6!
                                          .apply(
                                              color: ThemeLight.primaryColor,
                                              fontSizeDelta: 12),
                                    ),
                                  ],
                                ),
                                SmoothPageIndicator(
                                  controller: controller,
                                  count: 3,
                                  effect: WormEffect(
                                      dotHeight: 8,
                                      dotWidth: 12,
                                      spacing: 2,
                                      activeDotColor: ThemeLight.primaryColor,
                                      dotColor: Colors.grey),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (page == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  } else {
                                    controller.nextPage(
                                        duration: (const Duration(
                                            milliseconds: 1000)),
                                        curve: Curves.decelerate);
                                  }
                                });
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const CircleBorder(),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(60, 60))),
                              child: page == 2
                                  ? const Icon(
                                      Icons.check,
                                      size: 32,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.arrow_back_ios_new,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
