import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onPressed;
  final String? number;

  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: fontWeightMedium,
                ),
              ),
            ),
            if (number != null)
              Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  number!,
                  style: whiteTextStyle.copyWith(
                    fontWeight: fontWeightMedium,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
