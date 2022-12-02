import 'package:bank_sha/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TipItem extends StatelessWidget {
  final String image;
  final String title;
  final String url;

  const TipItem({
    Key? key,
    required this.image,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          launchUrl(Uri.parse(url));
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
                image,
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 2.45,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
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
