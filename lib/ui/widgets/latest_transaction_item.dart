import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class LatestTransactionItem extends StatelessWidget {
  final String icon;
  final String title;
  final String date;
  final String price;

  const LatestTransactionItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.date,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 48,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: fontWeightMedium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: fontWeightMedium,
            ),
          ),
        ],
      ),
    );
  }
}
