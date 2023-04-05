import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class TopupItem extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool? active;
  final VoidCallback? onPressed;

  const TopupItem({
    Key? key,
    required this.paymentMethod,
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
              paymentMethod.thumbnail.toString(),
              height: 30,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  paymentMethod.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: fontWeightMedium,
                  ),
                ),
                Text(
                  '50 mins',
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
