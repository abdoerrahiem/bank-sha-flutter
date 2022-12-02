import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfileEditPinScreen extends StatelessWidget {
  const ProfileEditPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Edit PIN', context),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Input(
                  title: 'Old PIN',
                ),
                const SizedBox(
                  height: 16,
                ),
                const Input(
                  title: 'New PIN',
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                  title: 'Update Now',
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
