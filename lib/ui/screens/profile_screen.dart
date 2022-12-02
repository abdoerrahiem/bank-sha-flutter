import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('My Profile', context),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/profile.png',
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Abdur Rahim',
                  style: blackTextStyle.copyWith(
                    fontWeight: fontWeightMedium,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),
                ProfileMenuItem(
                  icon: 'assets/images/user.png',
                  title: 'Edit Profile',
                  onPressed: () async =>
                      await Navigator.pushNamed(context, '/pin') == true
                          ? Navigator.pushNamed(context, '/profile-edit')
                          : null,
                ),
                ProfileMenuItem(
                  icon: 'assets/images/pin.png',
                  title: 'My Pin',
                  onPressed: () async =>
                      await Navigator.pushNamed(context, '/pin') == true
                          ? Navigator.pushNamed(context, '/profile-edit-pin')
                          : null,
                ),
                ProfileMenuItem(
                  icon: 'assets/images/wallet.png',
                  title: 'Wallet Settings',
                  onPressed: () => {},
                ),
                ProfileMenuItem(
                  icon: 'assets/images/award.png',
                  title: 'My Rewards',
                  onPressed: () => {},
                  number: '2',
                ),
                ProfileMenuItem(
                  icon: 'assets/images/help.png',
                  title: 'Help Center',
                  onPressed: () => {},
                ),
                ProfileMenuItem(
                  icon: 'assets/images/logout.png',
                  title: 'Logout',
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          ButtonText(
            title: 'Report a Problem',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
