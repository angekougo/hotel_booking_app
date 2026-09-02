import 'package:flutter/material.dart';

import '../../config/app_style.dart';
import '../../config/constants/app_dimensions.dart';

class FormTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const FormTitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.left,
                  title,
                  style: AppStyle.display(context),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  subTitle,
                  style: AppStyle.subtitle(context),
                ),
              ),
              SizedBox(
                height: AppDimensions.spaceExtraLarge,
              ),
      ],
    );
  }
}