import 'package:flutter/material.dart';
import 'package:hotel_booking_app/config/app_style.dart';

class HomeSectionTitle extends StatelessWidget {

  final String title;

  const HomeSectionTitle({
    super.key, required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppStyle.homeSectiontitle(context),
      ),
    );
  }
}
