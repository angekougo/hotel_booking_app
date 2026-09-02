import 'package:flutter/material.dart';
import 'package:hotel_booking_app/config/utils/context_utils.dart';
import 'package:hotel_booking_app/data/models/onboarding_item.dart';

import '../../config/app_style.dart';
import '../../config/constants/app_dimensions.dart';
import '../../config/constants/app_strings.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: height * AppDimensions.imageOnboardingHeightRatio,
          child: Image.asset(
            item.imagePath,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: AppDimensions.spaceLarge, right: AppDimensions.spaceLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppStrings.onboardTitleOne,
                  style: AppStyle.display(context),
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.onboardParagraphOne,
                  style: AppStyle.body(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
