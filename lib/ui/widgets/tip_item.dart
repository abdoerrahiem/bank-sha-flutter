import 'package:bank_sha/models/tip_model.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TipItem extends StatelessWidget {
  final TipModel tip;

  const TipItem({
    Key? key,
    required this.tip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(tip.url!))) {
          launchUrl(Uri.parse(tip.url!));
        }
      },
      child: Container(
        // height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width / 2.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                tip.thumbnail!,
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 2.45,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                tip.title!,
                style: blackTextStyle.copyWith(
                  fontWeight: fontWeightMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
