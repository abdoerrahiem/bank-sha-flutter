import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String title;
  final bool isPassword;
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChangeText;

  const Input(
      {Key? key,
      this.title = '',
      this.isPassword = false,
      this.placeholder = '',
      this.controller,
      this.textInputType = TextInputType.text,
      this.onFieldSubmitted,
      this.onChangeText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Column(
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: fontWeightMedium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: textInputType,
          style: blackTextStyle.copyWith(
            fontSize: 14,
          ),
          onChanged: (value) => {
            if (onChangeText != null) {onChangeText!(value)}
          },
          decoration: InputDecoration(
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: const EdgeInsets.all(14),
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
