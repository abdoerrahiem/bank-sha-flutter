import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/register_model.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterKtp extends StatefulWidget {
  final RegisterModel data;

  const RegisterKtp({Key? key, required this.data}) : super(key: key);

  @override
  State<RegisterKtp> createState() => _RegisterKtpState();
}

class _RegisterKtpState extends State<RegisterKtp> {
  XFile? image;
  int activeButton = 0;

  _handleImage() async {
    final selectedImage = await selectImage();

    setState(() {
      image = selectedImage;
    });
  }

  void _handleContinue(bool skip, int buttonNumber) {
    if (!skip && image == null) {
      return showSnackbar(context, 'Please pick your KTP!');
    }

    setState(() {
      activeButton = buttonNumber;
    });

    context.read<AuthBloc>().add(
          AuthRegister(
            widget.data.copyWith(
                ktp: image == null
                    ? null
                    : 'data:image/png;base64,${base64Encode(
                        File(image!.path).readAsBytesSync(),
                      )}'),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) => ListView(
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
              'Verify You\nAccount',
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
                children: [
                  GestureDetector(
                    onTap: _handleImage,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBackgroundColor,
                        image: image != null
                            ? DecorationImage(
                                image: FileImage(
                                  File(image!.path),
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: image != null
                          ? null
                          : Center(
                              child: Image.asset(
                                'assets/images/upload.png',
                                width: 32,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Passport/ID Card',
                    style: blackTextStyle.copyWith(
                      fontWeight: fontWeightMedium,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Button(
                    title: 'Continue',
                    onPressed: () => _handleContinue(false, 0),
                    loading: state is AuthLoading && activeButton == 0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonText(
              title: 'Skip for Now',
              onPressed: () => _handleContinue(true, 1),
              loading: state is AuthLoading && activeButton == 1,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        listener: (context, state) {
          if (state is AuthFailed) {
            showSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/register-success', (route) => false);
          }
        },
      ),
    );
  }
}
