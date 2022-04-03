import 'package:corona_news/data/repo/corona_repository.dart';
import 'package:corona_news/screen/chart/bloc/chart_bloc.dart';
import 'package:corona_news/theme/main_theme.dart';
import 'package:corona_news/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'chart/bar_chart.dart';
import 'item_country.dart';

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
                                          .copyWith(
                                              color: ThemeLight.primaryColor),
                                    ),
                                    Text(
                                      state.coronas.deaths!,
                                      style: themeData.textTheme.headline6!
                                          .copyWith(fontSize: 32),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      case 3:
                        return AspectRatio(
                          aspectRatio: 3,
                          child: Container(
                            margin: const EdgeInsets.all(22),
                            height: 100,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/icon/danger.png',
                                  width: 32,
                                  height: 32,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'دهان و بینی خود را در زمان سرفه یا عطسه\n با آرنج یا یک دستمال بپوشانید\n. فورا دستمال استفاده شده را دور بیندازید.',
                                  style:
                                      themeData.textTheme.bodyText2!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        );
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
                return Center(child: Text(state.appException.message));
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
