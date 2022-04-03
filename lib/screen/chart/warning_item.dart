import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WarningItem extends StatelessWidget {
  const WarningItem({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
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
              style: themeData.textTheme.bodyText2!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
