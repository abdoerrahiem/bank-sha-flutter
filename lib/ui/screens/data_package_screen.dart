import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackageScreen extends StatefulWidget {
  final OperatorCardModel operatorCard;

  const DataPackageScreen({
    Key? key,
    required this.operatorCard,
  }) : super(key: key);

  @override
  State<DataPackageScreen> createState() => _DataPackageScreenState();
}

class _DataPackageScreenState extends State<DataPackageScreen> {
  final TextEditingController phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;
  String phone = '';

  _handleContinue(BuildContext context) async {
    if (await Navigator.pushNamed(context, '/pin') == true) {
      final authState = context.read<AuthBloc>().state;
      String pin = '';
      if (authState is AuthSuccess) {
        pin = authState.user.pin!;
      }

      context.read<DataPlanBloc>().add(
            DataPlanPost(
              DataPlanFormModel(
                dataPlanId: selectedDataPlan?.id,
                phoneNumber: phoneController.text,
                pin: pin,
              ),
            ),
          );
    }
  }

  _handlePress(DataPlanModel item) {
    setState(() {
      if (item.id == selectedDataPlan?.id) {
        selectedDataPlan = null;
      } else {
        selectedDataPlan = item;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Paket Data', context),
      body: BlocProvider(
        create: (context) => DataPlanBloc(),
        child: BlocConsumer<DataPlanBloc, DataPlanState>(
          listener: (context, state) {
            if (state is DataPlanFailed) {
              showSnackbar(context, state.e);
            }

            if (state is DataPlanSuccess) {
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      selectedDataPlan!.price! * -1,
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/data-provider-success', (route) => false);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.all(25),
                  children: [
                    Text(
                      'Phone Number',
                      style: blackTextStyle.copyWith(
                        fontWeight: fontWeightSemiBold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Input(
                      controller: phoneController,
                      placeholder: '+628',
                      onChangeText: (String value) {
                        setState(() {
                          phone = value;
                        });
                      },
                    ),
                    widget.operatorCard.dataPlans == null
                        ? Container()
                        : buildResult(context, widget.operatorCard.dataPlans!,
                            selectedDataPlan, _handlePress),
                    const SizedBox(height: 50),
                  ],
                ),
                if (selectedDataPlan != null && phone.isNotEmpty)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Button(
                        title: 'Continue',
                        onPressed: () => _handleContinue(context),
                        loading: state is DataPlanLoading,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget buildResult(BuildContext context, List<DataPlanModel> dataPlans,
    DataPlanModel? selectedDataPlan, handlePress) {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Package',
          style: blackTextStyle.copyWith(
            fontWeight: fontWeightSemiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 14),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            runSpacing: 15,
            spacing: 15,
            children: dataPlans
                .map((plan) => PackageItem(
                      name: plan.name.toString(),
                      price:
                          formatRupiah(number: plan.price!, showComplete: true),
                      isActive: selectedDataPlan?.id == plan.id,
                      onPressed: () => handlePress(plan),
                    ))
                .toList(),
          ),
        ),
      ],
    ),
  );
}
