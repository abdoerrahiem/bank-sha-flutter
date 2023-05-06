import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final OperatorCardModel operatorCard;
  final bool? active;
  final VoidCallback? onPressed;

  const DataProviderItem({
    Key? key,
    required this.operatorCard,
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
            Image.network(
              operatorCard.thumbnail.toString(),
              height: 30,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  operatorCard.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: fontWeightMedium,
                  ),
                ),
                Text(
                  operatorCard.status.toString() == 'active'
                      ? 'Available'
                      : 'Not Available',
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
