import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/ui/screens/transfer_amount_screen.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final UserModel? user;

  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransferAmountScreen(
              data: TransferFormModel(sendTo: user!.username),
            ),
          ),
        );
      },
      child: Container(
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
                  image: user?.profilePicture == null
                      ? const AssetImage('assets/images/profile.png')
                      : NetworkImage(user!.profilePicture!) as ImageProvider,
                ),
              ),
            ),
            const SizedBox(height: 13),
            Text(
              '@${user!.username}',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: fontWeightMedium,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
