import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/transaction/transaction_bloc.dart';
import 'package:bank_sha/ui/widgets/home_more_dialog.dart';
import 'package:bank_sha/ui/widgets/latest_transaction_item.dart';
import 'package:bank_sha/ui/widgets/service_item.dart';
import 'package:bank_sha/ui/widgets/tip_item.dart';
import 'package:bank_sha/ui/widgets/user_item.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() => currentIndex = value),
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: fontWeightMedium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: fontWeightMedium,
          ),
          elevation: 0,
          backgroundColor: whiteColor,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/overview.png',
                width: 20,
                color: currentIndex == 0 ? blueColor : blackColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/history.png',
                width: 20,
                color: currentIndex == 1 ? blueColor : blackColor,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/statistic.png',
                width: 20,
                color: currentIndex == 2 ? blueColor : blackColor,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/reward.png',
                width: 20,
                color: currentIndex == 3 ? blueColor : blackColor,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/images/add.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: currentIndex == 0
          ? ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                buildProfile(context),
                buildWalletCard(),
                buildLevel(),
                buildServices(context),
                buildLatestTransactions(),
                buildSendAgain(),
                buildFriendlyTips(),
                const SizedBox(height: 50),
              ],
            )
          : buildHistory(),
    );
  }
}

Widget buildHistory() {
  return Center(
    child: Text(
      'On Development !',
      style: blackTextStyle.copyWith(
        fontWeight: fontWeightMedium,
        fontSize: 16,
      ),
    ),
  );
}

Widget buildProfile(BuildContext context) {
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      if (state is AuthSuccess) {
        return Container(
          margin: const EdgeInsets.only(
            top: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy,',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    state.user.name.toString(),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: fontWeightSemiBold,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/profile'),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: state.user.profilePicture == null ||
                              state.user.profilePicture.toString().isEmpty
                          ? const AssetImage(
                              'assets/images/profile.png',
                            )
                          : NetworkImage(state.user.profilePicture!)
                              as ImageProvider,
                    ),
                  ),
                  child: state.user.verified == 1
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: whiteColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check_circle,
                                color: greenColor,
                                size: 16,
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        );
      }

      return Container();
    },
  );
}

Widget buildWalletCard() {
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      if (state is AuthSuccess) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 30,
          ),
          padding: const EdgeInsets.all(
            30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              28,
            ),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/card.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.user.name.toString(),
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: fontWeightMedium,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '**** **** **** ${state.user.cardNumber.toString().substring(12, 16)}',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: fontWeightMedium,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Text(
                'Balance',
                style: whiteTextStyle,
              ),
              Text(
                formatRupiah(number: state.user.balance ?? 0),
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: fontWeightMedium,
                ),
              ),
            ],
          ),
        );
      }

      return Container();
    },
  );
}

Widget buildLevel() {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: whiteColor,
    ),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'Level 1',
              style: blackTextStyle.copyWith(
                fontWeight: fontWeightMedium,
              ),
            ),
            const Spacer(),
            Text(
              '55% ',
              style: greenTextStyle.copyWith(
                fontWeight: fontWeightSemiBold,
              ),
            ),
            Text(
              'of Rp 20.000',
              style: blackTextStyle.copyWith(
                fontWeight: fontWeightSemiBold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(55),
          child: LinearProgressIndicator(
            value: 0.55,
            valueColor: AlwaysStoppedAnimation(greenColor),
            backgroundColor: lightBackgroundColor,
            minHeight: 5,
          ),
        )
      ],
    ),
  );
}

Widget buildServices(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Do Something',
          style: blackTextStyle.copyWith(
            fontWeight: fontWeightSemiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ServiceItem(
              iconName: 'assets/images/topup.png',
              title: 'Top Up',
              onPressed: () => Navigator.pushNamed(context, '/top-up'),
            ),
            ServiceItem(
              iconName: 'assets/images/send.png',
              title: 'Send',
              onPressed: () => Navigator.pushNamed(context, '/transfer'),
            ),
            ServiceItem(
              iconName: 'assets/images/withdraw.png',
              title: 'Withdraw',
              onPressed: () => {},
            ),
            ServiceItem(
              iconName: 'assets/images/more.png',
              title: 'More',
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (builder) => const HomeMoreDialog())
              },
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildLatestTransactions() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Transaction',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 12,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: BlocProvider(
            create: (context) => TransactionBloc()..add(TransactionGet()),
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state is TransactionSuccess) {
                  return Column(
                    children: state.transactions
                        .map(
                          (transaction) =>
                              LatestTransactionItem(transaction: transaction),
                        )
                        .toList(),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildSendAgain() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send Again',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: 14),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              UserItem(
                image: 'assets/images/profile.png',
                name: 'abdoerrahiem',
              ),
              UserItem(
                image: 'assets/images/profile.png',
                name: 'abdoerrahiem',
              ),
              UserItem(
                image: 'assets/images/profile.png',
                name: 'abdoerrahiem',
              ),
              UserItem(
                image: 'assets/images/profile.png',
                name: 'abdoerrahiem',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildFriendlyTips() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Friendly Tips',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 17,
          runSpacing: 18,
          children: const [
            TipItem(
              image:
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8',
              title:
                  'Best tips for using a credit card Best tips for using a credit card',
              url: 'https://google.com',
            ),
            TipItem(
              image:
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8',
              title:
                  'Best tips for using a credit card Best tips for using a credit card',
              url: 'https://google.com',
            ),
            TipItem(
              image:
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8',
              title:
                  'Best tips for using a credit card Best tips for using a credit card',
              url: 'https://google.com',
            ),
            TipItem(
              image:
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8',
              title:
                  'Best tips for using a credit card Best tips for using a credit card',
              url: 'https://google.com',
            ),
          ],
        )
      ],
    ),
  );
}
