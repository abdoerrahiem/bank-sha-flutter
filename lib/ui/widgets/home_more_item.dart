import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class HomeMoreItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onPressed;

  const HomeMoreItem({
    Key? key,
    required this.image,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.width / 5,
            child: Image.asset(
              image,
              width: 26,
              height: 26,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightMedium,
            ),
          ),
        ],
      ),
    );
  }
}
