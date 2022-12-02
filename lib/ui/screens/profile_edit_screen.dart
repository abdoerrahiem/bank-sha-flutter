import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _handleUpdate() {
      Navigator.popAndPushNamed(context, '/profile-edit-success');
    }

    return Scaffold(
      appBar: defaultAppbar('Edit Profile', context),
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
                  title: 'Username',
                ),
                const SizedBox(
                  height: 16,
                ),
                const Input(
                  title: 'Full Name',
                ),
                const SizedBox(
                  height: 16,
                ),
                const Input(
                  title: 'Email Address',
                ),
                const SizedBox(
                  height: 16,
                ),
                const Input(
                  title: 'Password',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                  title: 'Update Now',
                  onPressed: _handleUpdate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
