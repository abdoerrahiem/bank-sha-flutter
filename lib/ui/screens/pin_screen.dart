import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController controller = TextEditingController(text: '');

  _addPin(String text) {
    if (controller.text.length < 6) {
      setState(() {
        controller.text = '${controller.text}$text';
      });
    }

    if (controller.text == '123456') {
      Navigator.pop(context, true);
    } else if (controller.text.length == 6 && controller.text != '123456') {
      showSnackbar(context, 'Pin is not valid!');
    }
  }

  _deletePin() {
    setState(() {
      if (controller.text.isNotEmpty) {
        List<String> updatedText = controller.text.split('');
        updatedText.removeLast();
        controller.text = updatedText.join();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sha Pin',
              style: whiteTextStyle.copyWith(
                  fontSize: 20, fontWeight: fontWeightSemiBold),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: controller,
                enabled: false,
                obscureText: true,
                obscuringCharacter: '*',
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: fontWeightMedium,
                  letterSpacing: 16,
                ),
                cursorColor: greyColor,
                decoration: InputDecoration(
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Wrap(
              alignment: WrapAlignment.end,
              runSpacing: 40,
              spacing: 40,
              children: [
                PinButton(
                  title: '1',
                  onPressed: () => _addPin('1'),
                ),
                PinButton(
                  title: '2',
                  onPressed: () => _addPin('2'),
                ),
                PinButton(
                  title: '3',
                  onPressed: () => _addPin('3'),
                ),
                PinButton(
                  title: '4',
                  onPressed: () => _addPin('4'),
                ),
                PinButton(
                  title: '5',
                  onPressed: () => _addPin('5'),
                ),
                PinButton(
                  title: '6',
                  onPressed: () => _addPin('6'),
                ),
                PinButton(
                  title: '7',
                  onPressed: () => _addPin('7'),
                ),
                PinButton(
                  title: '8',
                  onPressed: () => _addPin('8'),
                ),
                PinButton(
                  title: '9',
                  onPressed: () => _addPin('9'),
                ),
                PinButton(
                  title: '0',
                  onPressed: () => _addPin('0'),
                ),
                PinButton(
                  icon: Icons.arrow_back,
                  onPressed: _deletePin,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
