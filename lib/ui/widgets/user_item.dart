import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String image;
  final String name;

  const UserItem({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          const SizedBox(height: 13),
          Text(
            '@$name',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: fontWeightMedium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
