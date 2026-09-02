import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/config/constants/app_dimensions.dart';

class AppStyle{



  // Very large title
  static TextStyle display(BuildContext context){
    return GoogleFonts.cormorantGaramond(
      fontSize: AppDimensions.fontDisplay,
      fontWeight: FontWeight.bold,
      // for adaption black and white automaticly
      color: Theme.of(context).colorScheme.onSurface, 
    );
  }

  static TextStyle displayWhiteWhithShadow(BuildContext context){
    return GoogleFonts.cormorantGaramond(
      fontSize: AppDimensions.fontDisplay,
      fontWeight: FontWeight.bold,
      shadows: [
      Shadow(
        color: Colors.black.withValues(alpha: 0.5),
        offset: const Offset(2.0, 2.0),
        blurRadius: 4.0,
      ),
    ],
      // for adaption black and white automaticly
      color: Colors.white, 
    );
  }

  static TextStyle displayWelcomeHomeText(BuildContext context){
    return GoogleFonts.cormorantGaramond(
      fontSize: AppDimensions.fontLargeDisplay,
      fontWeight: FontWeight.bold,
      // for adaption black and white automaticly
      color: Colors.white, 
    );
  }

  // Standart title
  static TextStyle titleText(BuildContext context){
    return GoogleFonts.cormorantGaramond(
      fontSize: AppDimensions.fontBodyLarge,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle title(BuildContext context){
    return GoogleFonts.cormorantGaramond(
      fontSize: AppDimensions.fontTitle,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  // Style for subtitle
  static TextStyle subtitle(BuildContext context){
    return GoogleFonts.cormorantGaramond(
      fontSize: AppDimensions.fontSubtitle,
      fontStyle: FontStyle.italic,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  // Standard body text (Paragraphs)
  static TextStyle body(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: AppDimensions.fontBody,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle bodyPrimary(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: AppDimensions.fontBody,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  static TextStyle textButtonPrimary (BuildContext context){
    return GoogleFonts.inter(
      fontSize: AppDimensions.fontBody,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onPrimary
    );
  }

  static TextStyle textButtonOnCardInVerticalList (BuildContext context){
    return GoogleFonts.inter(
      fontSize: AppDimensions.fontBody,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.primary
    );
  }

  static TextStyle titleInkwellCard (BuildContext context){
    return GoogleFonts.cormorantGaramond(
      fontSize: AppDimensions.fontBodyLarge,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle homeSectiontitle(BuildContext context){
    return GoogleFonts.cormorantGaramond(
      fontSize: AppDimensions.fontTitle,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  // room card description text style
  static TextStyle roomCardDescriptionTablet(BuildContext context){
    return GoogleFonts.inter(
      fontSize: AppDimensions.fontBody,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
    );
  }

}