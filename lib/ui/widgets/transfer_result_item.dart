import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class TransferResultItem extends StatelessWidget {
  final UserModel user;
  final bool isActive;
  final VoidCallback? onPressed;

  const TransferResultItem({
    Key? key,
    required this.user,
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
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.profilePicture == null
                      ? 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg'
                      : user.profilePicture.toString()),
                ),
              ),
              child: user.verified == 1
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 20,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 13),
            Text(
              user.name.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: fontWeightMedium,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '@${user.username}',
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
