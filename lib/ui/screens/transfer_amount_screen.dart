import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/transfer/transfer_bloc.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferAmountScreen extends StatefulWidget {
  final TransferFormModel data;

  const TransferAmountScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<TransferAmountScreen> createState() => _TransferAmountScreenState();
}

class _TransferAmountScreenState extends State<TransferAmountScreen> {
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

  _handleContinue(BuildContext context) async {
    if (inputText.isEmpty) {
      return showSnackbar(context, 'Masukkan jumlah transfer!');
    }

    if (await Navigator.pushNamed(context, '/pin') == true) {
      final authState = context.read<AuthBloc>().state;
      String pin = '';
      if (authState is AuthSuccess) {
        pin = authState.user.pin!;
      }

      context.read<TransferBloc>().add(
            TransferPost(
              widget.data.copyWith(pin: pin, amount: inputText),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TransferBloc(),
        child: BlocConsumer<TransferBloc, TransferState>(
          listener: (context, state) {
            if (state is TransferFailed) {
              showSnackbar(context, state.e);
            }

            if (state is TransferSuccess) {
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(inputText) * -1,
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/transfer-success', (route) => false);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
                      title: 'Continue',
                      onPressed: () => _handleContinue(context),
                      loading: state is TransferLoading,
                    ),
                    const SizedBox(height: 25),
                    ButtonText(
                      title: 'Terms & Conditions',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
