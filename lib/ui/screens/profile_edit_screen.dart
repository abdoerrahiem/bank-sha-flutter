import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/user_edit_model.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final username = TextEditingController(text: '');
  final name = TextEditingController(text: '');
  final email = TextEditingController(text: '');
  final password = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      setState(() {
        username.text = authState.user.username!;
        name.text = authState.user.name!;
        email.text = authState.user.email!;
        password.text = authState.user.password!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Edit Profile', context),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.popAndPushNamed(context, '/profile-edit-success');
          }
        },
        builder: (context, state) {
          return ListView(
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
                    Input(
                      title: 'Username',
                      controller: username,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Input(
                      title: 'Full Name',
                      controller: name,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Input(
                      title: 'Email Address',
                      controller: email,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Input(
                      title: 'Password',
                      isPassword: true,
                      controller: password,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdateUser(
                                UserEditModel(
                                  username: username.text,
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                ),
                              ),
                            );
                      },
                      loading: state is AuthLoading,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
