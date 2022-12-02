import 'package:another_flushbar/flushbar.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void showSnackbar(BuildContext context, message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 3),
  ).show(context);
}

String formatRupiah({num number = 0, bool showComplete = true}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: showComplete ? 'Rp ' : '',
    decimalDigits: 0,
  ).format(number);
}

String baseUrl = 'https://bwabank.my.id/api';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<XFile?> selectImage() async {
  XFile? selectedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  return selectedImage;
}
