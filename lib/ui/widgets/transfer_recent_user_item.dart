import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final String image;
  final String name;
  final String username;
  final bool isVerified;
  final bool isActive;
  final VoidCallback? onPressed;

  const TransferRecentUserItem({
    Key? key,
    required this.image,
    required this.name,
    required this.username,
    this.isVerified = false,
    this.isActive = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? blueColor : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontWeight: fontWeightMedium,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    '@$username',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            if (isVerified == true)
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Icon(
                      Icons.check,
                      color: whiteColor,
                      size: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Verified',
                    style: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: fontWeightMedium,
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
