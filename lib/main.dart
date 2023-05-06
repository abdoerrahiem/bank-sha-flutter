import 'dart:io';

import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/user/user_bloc.dart';
// import 'package:bank_sha/ui/screens/data_package_screen.dart';
import 'package:bank_sha/ui/screens/data_provider_screen.dart';
import 'package:bank_sha/ui/screens/data_provider_success_screen.dart';
import 'package:bank_sha/ui/screens/home_screen.dart';
import 'package:bank_sha/ui/screens/login_screen.dart';
import 'package:bank_sha/ui/screens/onboarding_screen.dart';
import 'package:bank_sha/ui/screens/pin_screen.dart';
import 'package:bank_sha/ui/screens/profile_edit_pin_screen.dart';
import 'package:bank_sha/ui/screens/profile_edit_screen.dart';
import 'package:bank_sha/ui/screens/profile_edit_success_screen.dart';
import 'package:bank_sha/ui/screens/profile_screen.dart';
import 'package:bank_sha/ui/screens/register_screen.dart';
// import 'package:bank_sha/ui/screens/register_ktp_screen.dart';
// import 'package:bank_sha/ui/screens/register_photo_screen.dart';
import 'package:bank_sha/ui/screens/register_success_screen.dart';
import 'package:bank_sha/ui/screens/splash_screen.dart';
// import 'package:bank_sha/ui/screens/topup_amount_screen.dart';
import 'package:bank_sha/ui/screens/topup_screen.dart';
import 'package:bank_sha/ui/screens/topup_success_screen.dart';
// import 'package:bank_sha/ui/screens/transfer_amount_screen.dart';
import 'package:bank_sha/ui/screens/transfer_screen.dart';
import 'package:bank_sha/ui/screens/transfer_success_screen.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc()..add(AuthGetCurrentUser())),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: blackColor),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: fontWeightSemiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          // '/register-photo': (context) => const RegisterPhotoScreen(),
          // '/register-ktp': (context) => const RegisterKtp(),
          '/register-success': (context) => const RegisterSucess(),
          '/home': (context) => const HomeScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/pin': (context) => const PinScreen(),
          '/profile-edit': (context) => const ProfileEditScreen(),
          '/profile-edit-pin': (context) => const ProfileEditPinScreen(),
          '/profile-edit-success': (context) =>
              const ProfileEditSuccessScreen(),
          '/top-up': (context) => const TopupScreen(),
          // '/top-up-amount': (context) => const TopupAmountScreen(),
          '/top-up-success': (context) => const TopupSuccessScreen(),
          '/transfer': (context) => const TransferScreen(),
          // '/transfer-amount': (context) => const TransferAmountScreen(),
          '/transfer-success': (context) => const TransferSuccessScreen(),
          '/data-provider': (context) => const DataProviderScreen(),
          // '/data-package': (context) => const DataPackageScreen(),
          '/data-provider-success': (context) =>
              const DataProviderSuccessScreen(),
        },
      ),
    );
  }
}
