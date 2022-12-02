import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String iconName;
  final String title;
  final VoidCallback? onPressed;

  const ServiceItem({
    Key? key,
    required this.iconName,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Center(
              child: Image.asset(
                iconName,
                width: 26,
              ),
            ),
          ),
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
