import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/operator_card/operator_card_bloc.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/ui/screens/data_package_screen.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/data_provider_item.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderScreen extends StatefulWidget {
  const DataProviderScreen({Key? key}) : super(key: key);

  @override
  State<DataProviderScreen> createState() => _DataProviderScreenState();
}

class _DataProviderScreenState extends State<DataProviderScreen> {
  OperatorCardModel? operatorCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Beli Data', context),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'assets/images/cardSmall.png',
                width: 80,
                height: 55,
              ),
              const SizedBox(width: 15),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Column(
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
                          'Balance: ${formatRupiah(number: state.user.balance ?? 0, showComplete: true)}',
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => OperatorCardBloc()
              ..add(
                OperatorCardGet(),
              ),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                if (state is OperatorCardSuccess) {
                  return Column(
                    children: state.operatorCards
                        .map(
                          (item) => DataProviderItem(
                            operatorCard: item,
                            active: operatorCard?.id == item.id,
                            onPressed: () {
                              setState(() {
                                if (operatorCard?.id == item.id) {
                                  operatorCard = null;
                                } else {
                                  operatorCard = item;
                                }
                              });
                            },
                          ),
                        )
                        .toList(),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
      floatingActionButton: operatorCard != null
          ? Container(
              margin: const EdgeInsets.all(15),
              child: Button(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPackageScreen(
                        operatorCard: operatorCard!,
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
