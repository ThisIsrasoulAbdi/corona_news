import 'package:corona_news/contanse/constanse.dart';
import 'package:corona_news/data/repo/corona_repository.dart';
import 'package:corona_news/screen/chart/bloc/chart_bloc.dart';
import 'package:corona_news/screen/chart/warning_item.dart';
import 'package:corona_news/screen/home/info_item.dart';
import 'package:corona_news/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../contanse/main_theme.dart';
import 'chart/bar_chart.dart';
import 'item_country.dart';
import 'item_death.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        final chartBloc = ChartBloc(coronaRepository: coronaRepository);
        chartBloc.add(ChartStarted());
        return chartBloc;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ThemeLight.primaryColor,
          body: BlocBuilder<ChartBloc, ChartState>(
            builder: (context, state) {
              if (state is ChartSuccsess) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return ToggleSwitch(
                          minWidth: 400.0,
                          minHeight: 30.0,
                          borderWidth: 10,
                          radiusStyle: true,
                          fontSize: 18.0,
                          initialLabelIndex: 0,
                          activeBgColor: const [Colors.white],
                          activeFgColor: ThemeLight.primaryColor,
                          inactiveBgColor: Colors.white.withAlpha(80),
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ['کشور من', 'دید جهانی'],
                          onToggle: (index) {
                            //TODO ADD Index Counrty
                          },
                        );
                      case 1:
                        return AspectRatio(
                          aspectRatio: 2,
                          child: ItemCountry(
                              coronaEntity: state.coronas,
                              themeData: themeData),
                        );

                      case 2:
                        return DeathItem(
                            themeData: themeData, corona: state.coronas);
                      case 3:
                        return WarningItem(themeData: themeData);
                      case 4:
                        //TODO ADD Chart
                        return Stack(
                          children: [
                            const BarChartSample3(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'آمار مبتلا به کرونا',
                                style: themeData.textTheme.headline6!.copyWith(
                                    color: ThemeLight.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      default:
                        return Container();
                    }
                  },
                );
              } else if (state is ChartLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ChartErorre) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "اینترنت خود را بررسی کنید",
                      style: themeData.textTheme.bodyText2!
                          .copyWith(color: Colors.white),
                    ),
                    Container(
                      margin: EdgeInsets.all(Constanse.myPadding * 2),
                      height: 200,
                      decoration: BoxDecoration(
                        color: ThemeLight.colorWhite,
                        borderRadius:
                            BorderRadius.circular(Constanse.myPadding + 5),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'کاربر گرامی برای دریافت اطلاعات کرونا باید اینترنت شما متصل باشد لطفا اینترنت خود رابررسی کنید',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonHome(
                                  icon: Icons.check,
                                  onTap: () {
                                    BlocProvider.of<ChartBloc>(context)
                                        .add(ChartRefresh());
                                  },
                                  title: 'تلاش مجدد',
                                  themeData: themeData),
                              ButtonHome(
                                  icon: Icons.warning_rounded,
                                  onTap: () {
                                    //TODO ADD EXIT APPLICATIONS;
                                  },
                                  title: 'خروج از برنامه',
                                  themeData: themeData),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ));
              } else {
                throw Exception('state is not supported');
              }
            },
          ),
        ),
      ),
    );
  }
}
