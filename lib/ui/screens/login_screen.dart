import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/login_model.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  void _handleLogin() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      return showSnackbar(context, 'Please input all required data!');
    }

    context.read<AuthBloc>().add(
          AuthLogin(
            LoginModel(
              email: emailController.text,
              password: passwordController.text,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Container(
                width: 155,
                height: 50,
                margin: const EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logoBlack.png'),
                  ),
                ),
              ),
              Text(
                'Sign In &\nGrow Your Finance',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: fontWeightSemiBold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Input(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Password Input
                    Input(
                      title: 'Password',
                      isPassword: true,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ButtonText(
                      title: 'Forgot Password',
                      onPressed: () {},
                      alignment: Alignment.topRight,
                      textColor: blueColor,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      title: 'Sign In',
                      onPressed: _handleLogin,
                      loading: state is AuthLoading,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonText(
                title: 'Create New Account',
                onPressed: () => Navigator.pushNamed(context, '/register'),
              )
            ],
          );
        },
        listener: (context, state) {
          if (state is AuthFailed) {
            showSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
      ),
    );
  }
}
