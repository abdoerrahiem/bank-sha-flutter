import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String title;
  final double width;
  final double heigth;
  final VoidCallback? onPressed;
  final bool loading;

  const Button({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.heigth = 50,
    this.onPressed,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: TextButton(
        onPressed: loading ? () {} : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: purpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: whiteTextStyle.copyWith(
                fontWeight: fontWeightSemiBold,
                fontSize: 16,
              ),
            ),
            if (loading)
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: whiteColor,
                  strokeWidth: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String title;
  final double heigth;
  final VoidCallback? onPressed;
  final Color textColor;
  final Alignment alignment;
  final bool loading;

  const ButtonText({
    Key? key,
    required this.title,
    this.heigth = 24,
    this.onPressed,
    this.textColor = const Color(0xffA4A8AE),
    this.alignment = Alignment.center,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        height: heigth,
        child: TextButton(
          onPressed: loading ? () {} : onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
          ),
          child: loading
              ? Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: purpleColor,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}

class PinButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onPressed;

  const PinButton({
    Key? key,
    this.title,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: numberBackgroundColor,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 5.5,
          height: MediaQuery.of(context).size.width / 5.5,
          child: icon == null
              ? Text(
                  title!,
                  style: whiteTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: fontWeightSemiBold,
                  ),
                )
              : Icon(
                  icon,
                  color: whiteColor,
                ),
        ),
      ),
    );
  }
}
