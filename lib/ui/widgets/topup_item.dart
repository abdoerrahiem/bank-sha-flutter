import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class TopupItem extends StatelessWidget {
  final String image;
  final String title;
  final String time;
  final bool? active;
  final VoidCallback? onPressed;

  const TopupItem({
    Key? key,
    required this.image,
    required this.title,
    required this.time,
    this.active = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: active! ? blueColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 30,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: fontWeightMedium,
                  ),
                ),
                Text(
                  time,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
