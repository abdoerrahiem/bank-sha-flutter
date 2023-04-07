import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/ui/screens/topup_amount_screen.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bank_sha/ui/widgets/topup_item.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupScreen extends StatefulWidget {
  const TopupScreen({Key? key}) : super(key: key);

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  PaymentMethodModel? activePaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Top Up', context),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Image.asset(
                      'assets/images/cardSmall.png',
                      width: 80,
                      height: 55,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber.toString().replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontWeight: fontWeightMedium,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          state.user.name.toString(),
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }

              return Container();
            },
          ),
          const SizedBox(height: 40),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(GetPaymentMethod()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                    children: [
                      ...state.paymentMethods.map(
                        (paymentMethod) => TopupItem(
                          paymentMethod: paymentMethod,
                          onPressed: () {
                            setState(() {
                              activePaymentMethod = paymentMethod;
                            });
                          },
                          active: paymentMethod.id == activePaymentMethod?.id,
                        ),
                      ),
                      activePaymentMethod?.id != null
                          ? Column(
                              children: [
                                const SizedBox(height: 10),
                                Button(
                                  title: 'Continue',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TopupAmountScreen(
                                          data: TopupFormModel(
                                            paymentMethodCode:
                                                activePaymentMethod?.code,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            )
                          : Container(),
                    ],
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
