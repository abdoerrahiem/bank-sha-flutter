import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class DataPackageScreen extends StatefulWidget {
  const DataPackageScreen({Key? key}) : super(key: key);

  @override
  State<DataPackageScreen> createState() => _DataPackageScreenState();
}

class _DataPackageScreenState extends State<DataPackageScreen> {
  final TextEditingController phoneController = TextEditingController(text: '');
  String id = '';

  _handleContinue() async {
    if (await Navigator.pushNamed(context, '/pin') == true) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/data-provider-success', (route) => false);
    }
  }

  _handlePress(String currentId) {
    setState(() {
      id = currentId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Paket Data', context),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(25),
            children: [
              Text(
                'Phone Number',
                style: blackTextStyle.copyWith(
                  fontWeight: fontWeightSemiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 14),
              Input(
                controller: phoneController,
                placeholder: '+628',
              ),
              buildResult(context, id, _handlePress),
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
                  onPressed: _handleContinue,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget buildResult(BuildContext context, String id, handlePress) {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Package',
          style: blackTextStyle.copyWith(
            fontWeight: fontWeightSemiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 14),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            runSpacing: 15,
            spacing: 15,
            children: [
              PackageItem(
                name: '10 GB',
                price: 'Rp. 100.000',
                isActive: id == '1',
                onPressed: () => handlePress('1'),
              ),
              PackageItem(
                name: '20 GB',
                price: 'Rp. 200.000',
                isActive: id == '2',
                onPressed: () => handlePress('2'),
              ),
              PackageItem(
                name: '30 GB',
                price: 'Rp. 300.000',
                isActive: id == '3',
                onPressed: () => handlePress('3'),
              ),
              PackageItem(
                name: '40 GB',
                price: 'Rp. 400.000',
                isActive: id == '4',
                onPressed: () => handlePress('4'),
              ),
              PackageItem(
                name: '50 GB',
                price: 'Rp. 500.000',
                isActive: id == '5',
                onPressed: () => handlePress('5'),
              ),
              PackageItem(
                name: '60 GB',
                price: 'Rp. 600.000',
                isActive: id == '6',
                onPressed: () => handlePress('6'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
