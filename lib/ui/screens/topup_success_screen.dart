import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class TopupSuccessScreen extends StatelessWidget {
  const TopupSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Top Up\nWallet Berhasil',
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
              'Use the money wisely and\ngrow your finance',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              title: 'Back To Home',
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false),
              width: 183,
            )
          ],
        ),
      ),
    );
  }
}
