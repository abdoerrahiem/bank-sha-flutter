import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_item.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController usernameController =
      TextEditingController(text: '');

  void _handleOnPress() {
    Navigator.pushNamed(context, '/transfer-amount');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Transfer', context),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(25),
            children: [
              Text(
                'Search',
                style: blackTextStyle.copyWith(
                  fontWeight: fontWeightSemiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 14),
              Input(
                controller: usernameController,
                placeholder: 'By username',
              ),
              buildRecentUsers(),
              // buildResult(),
              const SizedBox(height: 50),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Button(
                title: 'Continue',
                onPressed: _handleOnPress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildRecentUsers() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Users',
          style: blackTextStyle.copyWith(
            fontWeight: fontWeightSemiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 14),
        const TransferRecentUserItem(
          image:
              'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
          name: 'Abdur Rahimddd dd dddddddd dd',
          username: 'abdoerrahiem',
          isVerified: true,
          isActive: true,
        ),
        const TransferRecentUserItem(
          image:
              'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
          name: 'Abdur Rahim',
          username: 'abdoerrahiem',
          isVerified: false,
          isActive: false,
        ),
      ],
    ),
  );
}

Widget buildResult() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
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
            children: const [
              TransferResultItem(
                image:
                    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
                name: 'Abdur Rahim',
                username: 'abdoerrahiem',
                isActive: true,
                isVerified: true,
              ),
              TransferResultItem(
                image:
                    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
                name: 'Abdur Rahim',
                username: 'abdoerrahiem',
              ),
              TransferResultItem(
                image:
                    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
                name: 'Abdur Rahim',
                username: 'abdoerrahiem',
              ),
              TransferResultItem(
                image:
                    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
                name: 'Abdur Rahim',
                username: 'abdoerrahiem',
              ),
              TransferResultItem(
                image:
                    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
                name: 'Abdur Rahim',
                username: 'abdoerrahiem',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
