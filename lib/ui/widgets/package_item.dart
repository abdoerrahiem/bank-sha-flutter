import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  final String name;
  final String price;
  final bool isActive;
  final VoidCallback? onPressed;

  const PackageItem({
    Key? key,
    required this.name,
    required this.price,
    this.isActive = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width / 2.5,
        height: width / 2,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? blueColor : whiteColor,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: fontWeightMedium,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
