import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/topup_item.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class DataProviderScreen extends StatefulWidget {
  const DataProviderScreen({Key? key}) : super(key: key);

  @override
  State<DataProviderScreen> createState() => _DataProviderScreenState();
}

class _DataProviderScreenState extends State<DataProviderScreen> {
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Beli Data', context),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(25),
            children: [
              Text(
                'From Wallet',
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
                        'Balance: Rp 180.000.000',
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
                'Select Provider',
                style: blackTextStyle.copyWith(
                  fontWeight: fontWeightSemiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 14),
              TopupItem(
                image: 'assets/images/telkomsel.png',
                title: 'Telkomsel',
                time: 'available',
                onPressed: () => setState(() => id = '1'),
                active: id == '1',
              ),
              TopupItem(
                image: 'assets/images/indosat.png',
                title: 'Indosat Ooredoo',
                time: 'available',
                onPressed: () => setState(() => id = '2'),
                active: id == '2',
              ),
              TopupItem(
                image: 'assets/images/singtel.png',
                title: 'Singtel ID',
                time: 'avaiable',
                onPressed: () => setState(() => id = '4'),
                active: id == '4',
              ),
              const SizedBox(height: 50),
            ],
          ),
          if (id.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Button(
                  title: 'Continue',
                  onPressed: () =>
                      Navigator.pushNamed(context, '/data-package'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
