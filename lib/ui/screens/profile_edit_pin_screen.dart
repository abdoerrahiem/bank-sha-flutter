import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinScreen extends StatefulWidget {
  const ProfileEditPinScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditPinScreen> createState() => _ProfileEditPinScreenState();
}

class _ProfileEditPinScreenState extends State<ProfileEditPinScreen> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Edit PIN', context),
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
                      title: 'Old PIN',
                      controller: oldPinController,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Input(
                      title: 'New PIN',
                      controller: newPinController,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdatePin(
                                  oldPinController.text, newPinController.text),
                            );
                      },
                      loading: State is AuthLoading,
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
