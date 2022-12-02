import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bank_sha/ui/widgets/topup_item.dart';
import 'package:bank_sha/utils/theme.dart';

class TopupScreen extends StatefulWidget {
  const TopupScreen({Key? key}) : super(key: key);

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Top Up', context),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'assets/images/cardSmall.png',
                width: 80,
                height: 55,
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1234 5678 9012',
                    style: blackTextStyle.copyWith(
                      fontWeight: fontWeightMedium,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Abdur Rahim',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          TopupItem(
            image: 'assets/images/bankBca.png',
            title: 'Bank BCA',
            time: '50 mins',
            onPressed: () => setState(() => id = '1'),
            active: id == '1',
          ),
          TopupItem(
            image: 'assets/images/bankBni.png',
            title: 'Bank BNI',
            time: '50 mins',
            onPressed: () => setState(() => id = '2'),
            active: id == '2',
          ),
          TopupItem(
            image: 'assets/images/bankMandiri.png',
            title: 'Bank Mandiri',
            time: '50 mins',
            onPressed: () => setState(() => id = '3'),
            active: id == '3',
          ),
          TopupItem(
            image: 'assets/images/bankOcbc.png',
            title: 'Bank OCBC',
            time: '50 mins',
            onPressed: () => setState(() => id = '4'),
            active: id == '4',
          ),
          const SizedBox(height: 10),
          Button(
            title: 'Continue',
            onPressed: () => Navigator.pushNamed(context, '/top-up-amount'),
          )
        ],
      ),
    );
  }
}
