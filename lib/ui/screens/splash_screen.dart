import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }

          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/onboarding', (route) => false);
          }
        },
        child: Container(),
        // child: Center(
        //   child: Container(
        //     width: 155,
        //     height: 50,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage('assets/images/logoWhite.png'),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
