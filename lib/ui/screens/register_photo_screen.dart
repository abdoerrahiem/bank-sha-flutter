import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/models/register_model.dart';
import 'package:bank_sha/ui/screens/register_ktp_screen.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPhotoScreen extends StatefulWidget {
  final RegisterModel data;

  const RegisterPhotoScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<RegisterPhotoScreen> createState() => _RegisterPhotoScreenState();
}

class _RegisterPhotoScreenState extends State<RegisterPhotoScreen> {
  final TextEditingController pinController = TextEditingController(text: '');
  XFile? image;

  void _handleImage() async {
    final selectedImage = await selectImage();

    setState(() {
      image = selectedImage;
    });
  }

  void _handleContinue() {
    if (pinController.text.trim().length != 6) {
      return showSnackbar(context, 'Pin should be six digits!');
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterKtp(
          data: widget.data.copyWith(
            pin: pinController.text,
            profilePicture: image == null
                ? null
                : 'data:image/png;base64,${base64Encode(
                    File(image!.path).readAsBytesSync(),
                  )}',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
            'Join Us to Unlock\nYour Growth',
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
                  'Abdur Rahim',
                  style: blackTextStyle.copyWith(
                    fontWeight: fontWeightMedium,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Input(
                  title: 'Set PIN (6 digit numbers)',
                  isPassword: true,
                  controller: pinController,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                  title: 'Continue',
                  onPressed: _handleContinue,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
