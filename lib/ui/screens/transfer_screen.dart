import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/ui/screens/transfer_amount_screen.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/input.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_item.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController usernameController =
      TextEditingController(text: '');
  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();

    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

  // void _handleOnPress() {
  //   Navigator.pushNamed(context, '/transfer-amount');
  // }

  void handlePress(UserModel user) {
    setState(() {
      if (selectedUser?.id == user.id) {
        selectedUser = null;
      } else {
        selectedUser = user;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar('Transfer', context),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          Input(
            controller: usernameController,
            placeholder: 'By username',
            onFieldSubmitted: (String value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(usernameController.text));
              } else {
                userBloc.add(UserGetRecent());
              }
              setState(() {
                selectedUser = null;
              });
            },
          ),
          usernameController.text.isEmpty
              ? buildRecentUsers(selectedUser, handlePress)
              : buildResult(selectedUser, handlePress),
          const SizedBox(height: 50),
        ],
      ),
      floatingActionButton: selectedUser != null
          ? Container(
              margin: const EdgeInsets.all(20),
              child: Button(
                title: 'Continue',
                onPressed: () {
                  // Navigator.pushNamed(context, '/transfer-amount');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferAmountScreen(
                        data: TransferFormModel(sendTo: selectedUser!.username),
                      ),
                    ),
                  );
                },
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget buildRecentUsers(UserModel? seletedUser, Function handlePress) {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Users',
          style: blackTextStyle.copyWith(
            fontWeight: fontWeightSemiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 14),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Column(
                children: state.users
                    .map(
                      (user) => TransferRecentUserItem(
                        user: user,
                        isActive: seletedUser?.id == user.id,
                        onPressed: () {
                          handlePress(user);
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
      ],
    ),
  );
}

Widget buildResult(UserModel? seletedUser, Function handlePress) {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(
            fontWeight: fontWeightSemiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 14),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: state.users
                      .map(
                        (user) => TransferResultItem(
                          user: user,
                          isActive: seletedUser?.id == user.id,
                          onPressed: () {
                            handlePress(user);
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
      ],
    ),
  );
}
