import 'package:flutter/material.dart';
import 'package:hotel_booking_app/config/constants/app_breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget? desktopBody;

  const ResponsiveLayout(
      {super.key,
      required this.mobileBody,
      required this.tabletBody,
      this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= AppBreakpoints.desktop) {
        return desktopBody ?? tabletBody;
      } else if (constraints.maxWidth >= AppBreakpoints.tablet) {
        return tabletBody;
      } else {
        return mobileBody;
      }
    });
  }
}
