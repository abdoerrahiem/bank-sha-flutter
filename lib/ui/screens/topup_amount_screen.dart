import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupAmountScreen extends StatefulWidget {
  const TopupAmountScreen({Key? key}) : super(key: key);

  @override
  State<TopupAmountScreen> createState() => _TopupAmountScreenState();
}

class _TopupAmountScreenState extends State<TopupAmountScreen> {
  final TextEditingController controller = TextEditingController(
    text: '',
  );
  String inputText = '';

  _addAmount(String text) {
    if (text == '0' && inputText.isEmpty) return;

    setState(() {
      String value = '$inputText$text';
      String updatedText = NumberFormat('#,##0', 'ID').format(int.parse(value));
      inputText = value;
      controller.text = updatedText;
    });
  }

  _deleteAmount() {
    setState(() {
      if (controller.text.isNotEmpty && inputText.isNotEmpty) {
        List<String> updatedText = inputText.split('');
        updatedText.removeLast();
        String updatedTextString = updatedText.join();
        inputText = updatedTextString;
        controller.text = updatedTextString.isEmpty
            ? ''
            : NumberFormat('#,##0', 'ID').format(int.parse(updatedTextString));
      }
    });
  }

  _handleCheckoutNow(BuildContext context) async {
    if (await Navigator.pushNamed(context, '/pin') == true) {
      await launchUrl(Uri.parse('https://demo.midtrans.com'));

      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
          context, '/top-up-success', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Amount',
                style: whiteTextStyle.copyWith(
                    fontSize: 20, fontWeight: fontWeightSemiBold),
              ),
              const SizedBox(height: 35),
              Align(
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: controller,
                    enabled: false,
                    style: whiteTextStyle.copyWith(
                      fontSize: inputText.length > 6 ? 26 : 36,
                      fontWeight: fontWeightMedium,
                    ),
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      prefixText: 'Rp ',
                      prefixStyle: whiteTextStyle.copyWith(
                        fontSize: inputText.length > 6 ? 26 : 36,
                        fontWeight: fontWeightMedium,
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                          width: 0.5,
                        ),
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
                    onPressed: () => _addAmount('1'),
                  ),
                  PinButton(
                    title: '2',
                    onPressed: () => _addAmount('2'),
                  ),
                  PinButton(
                    title: '3',
                    onPressed: () => _addAmount('3'),
                  ),
                  PinButton(
                    title: '4',
                    onPressed: () => _addAmount('4'),
                  ),
                  PinButton(
                    title: '5',
                    onPressed: () => _addAmount('5'),
                  ),
                  PinButton(
                    title: '6',
                    onPressed: () => _addAmount('6'),
                  ),
                  PinButton(
                    title: '7',
                    onPressed: () => _addAmount('7'),
                  ),
                  PinButton(
                    title: '8',
                    onPressed: () => _addAmount('8'),
                  ),
                  PinButton(
                    title: '9',
                    onPressed: () => _addAmount('9'),
                  ),
                  PinButton(
                    title: '0',
                    onPressed: () => _addAmount('0'),
                  ),
                  PinButton(
                    icon: Icons.arrow_back,
                    onPressed: _deleteAmount,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Button(
                title: 'Checkout Now',
                onPressed: () => _handleCheckoutNow(context),
              ),
              const SizedBox(height: 25),
              ButtonText(
                title: 'Terms & Conditions',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
