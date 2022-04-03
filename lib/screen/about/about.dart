import 'package:corona_news/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.asset('assets/images/developer.png'),
                  ),
                  Center(
                    child: Text(
                      'پيامبر (ص) می فرمایند : بهترين سخن، آن است كه قابل فهم و روشن و كوتاه باشد و خستگى نياورد . \n این پروژه برای دانشگاه جهاد مشهد نوشته شده است .',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Center(
                    child: Text(
                      'این پروژه توسط دانشجویان محمد رسول عبدی و آقای داودی نوشته شده .',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'راه های ارتباط با دانشجو',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.whatsapp,
                              color: Colors.green,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.telegram,
                              color: Colors.blue[400],
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              color: Colors.blue[700],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
