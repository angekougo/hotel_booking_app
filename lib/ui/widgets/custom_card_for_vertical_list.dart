import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/config/constants/app_breakpoints.dart';
import 'package:hotel_booking_app/config/constants/app_color.dart';
import 'package:hotel_booking_app/config/constants/app_dimensions.dart';
import 'package:hotel_booking_app/config/utils/context_utils.dart';
import 'package:hotel_booking_app/data/models/room.dart';

import '../../config/app_style.dart';
import '../../config/constants/app_routes.dart';

class CustomCardForVerticalList extends StatelessWidget {
  final Room room;
  final String buttonLabel;

  const CustomCardForVerticalList(
      {super.key, required this.room, this.buttonLabel = 'Voir'});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTablet = constraints.maxWidth > AppBreakpoints.tablet;

        final double imageHeight = isTablet ? AppDimensions.roomImageHeightTablet : AppDimensions.roomImageHeightMobile;
        final double imageWidth = isTablet ? AppDimensions.roomImageWidthTablet : AppDimensions.roomImageWidthMobile;

        return Card(
          color: AppColors.lightSurface,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                child: Image(
                  image: AssetImage(room.imageUrl),
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    width: imageWidth,
                    height: imageHeight,
                    child:  Icon(Icons.broken_image, color: context.colorScheme.onSurface),
                  ),
                ),
              ),
              SizedBox(width: isTablet ? AppDimensions.spaceLarge : AppDimensions.spaceSmall),
              Expanded(
                child: SizedBox(
                  height: imageHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: AppDimensions.spaceSmall,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room.title,
                              style: TextStyle(
                                fontSize: isTablet ? AppDimensions.fontBodyLarge : AppDimensions.fontBodyMedium,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: AppDimensions.maxLinesTitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: isTablet ? AppDimensions.spaceMedium : AppDimensions.spaceSmall),
                            Text(
                              room.description,
                              style: AppStyle.roomCardDescriptionTablet(context),
                              maxLines: isTablet ? AppDimensions.maxLinesDescTablet : AppDimensions.maxLinesDescMobile,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(onPressed: () {
                              context.push(AppRoutes.roomDetailPath, extra: room); // Navigue vers la page de détails de la chambre
                            }, child: Text(
                                buttonLabel,
                                style: AppStyle.textButtonOnCardInVerticalList(context),
                              ),),
                            
                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
