import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfileEditSuccessScreen extends StatelessWidget {
  const ProfileEditSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nice Update!',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: fontWeightSemiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Your data is safe with\nour system',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              title: 'My profile',
              onPressed: () => Navigator.pop(context),
              width: 183,
            )
          ],
        ),
      ),
    );
  }
}
