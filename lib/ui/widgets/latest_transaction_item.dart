import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const LatestTransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.network(
            transaction.transactionType!.thumbnail!
                .replaceAll(
                    'https://bwabank.my.id/storage/https://bwabank.my.id/storage',
                    'https://bwabank.my.id/storage')
                .replaceAll(
                    'https://bwabank.my.id/storage/https://bwabank.my.id/storage',
                    'https://bwabank.my.id/storage'),
            width: 48,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: fontWeightMedium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('MMM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${transaction.transactionType?.action == 'cr' ? '+' : '-'} ${formatRupiah(number: transaction.amount ?? 0, showComplete: false)}",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: fontWeightMedium,
            ),
          ),
        ],
      ),
    );
  }
}
