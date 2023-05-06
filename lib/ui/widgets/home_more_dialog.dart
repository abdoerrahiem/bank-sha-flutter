import 'dart:async';

import 'package:bank_sha/ui/widgets/home_more_item.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class HomeMoreDialog extends StatelessWidget {
  const HomeMoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 350,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: fontWeightSemiBold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              runSpacing: 30,
              spacing: 15,
              children: [
                HomeMoreItem(
                  image: 'assets/images/data.png',
                  title: 'Data',
                  onPressed: () {
                    Navigator.pushNamed(context, '/data-provider');
                    // Navigator.of(context, rootNavigator: true).pop();
                    // Timer(const Duration(seconds: 2), () {
                    //   Navigator.of(context, rootNavigator: true).pop();
                    // });
                  },
                ),
                const HomeMoreItem(
                  image: 'assets/images/water.png',
                  title: 'Water',
                ),
                const HomeMoreItem(
                  image: 'assets/images/stream.png',
                  title: 'Stream',
                ),
                const HomeMoreItem(
                  image: 'assets/images/movie.png',
                  title: 'Movie',
                ),
                const HomeMoreItem(
                  image: 'assets/images/food.png',
                  title: 'Food',
                ),
                const HomeMoreItem(
                  image: 'assets/images/travel.png',
                  title: 'Travel',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
