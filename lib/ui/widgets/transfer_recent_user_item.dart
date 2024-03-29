import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;
  final bool isActive;
  final VoidCallback? onPressed;

  const TransferRecentUserItem({
    Key? key,
    required this.user,
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
                  image: NetworkImage(user.profilePicture == null
                      ? 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg'
                      : user.profilePicture.toString()),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: fontWeightMedium,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    '@${user.username}',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            if (user.verified == 1)
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
