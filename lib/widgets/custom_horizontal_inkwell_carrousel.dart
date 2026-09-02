import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/config/app_style.dart';
import 'package:hotel_booking_app/config/constants/app_breakpoints.dart';
import 'package:hotel_booking_app/config/constants/app_dimensions.dart';
import 'package:hotel_booking_app/config/constants/app_routes.dart';
import 'package:hotel_booking_app/config/utils/context_utils.dart';
import 'package:hotel_booking_app/data/models/room.dart';

class CustomHorizontalInkwellCarrousel extends StatelessWidget {
  final List<Room> items;

  const CustomHorizontalInkwellCarrousel({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.screenWidth;
    final bool isTablet = screenWidth >= AppBreakpoints.tablet;

    final double height = isTablet
        ? AppDimensions.carrouselHeightTablet
        : AppDimensions.carrouselHeightMobile;
    final double width = isTablet
        ? AppDimensions.carrouselWidthTablet
        : AppDimensions.carrouselWidthMobile;

    return SizedBox(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Container(
              width: width,
              margin: const EdgeInsets.only(right: AppDimensions.spaceSmall),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.push(AppRoutes.roomDetailPath, extra: item);
                  },
                  borderRadius:
                      BorderRadius.circular(AppDimensions.spaceMedium),
                  child: Card(
                    // elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.spaceMedium)),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Ink.image(
                          image: AssetImage(item.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.black.withValues(
                              alpha: AppDimensions.cardOverlayOpacity),
                          // color: Colors.white.withValues(alpha:0.35),
                        ),
                        Positioned(
                          bottom: AppDimensions.spaceMedium,
                          left: AppDimensions.spaceMedium,
                          right: AppDimensions.spaceMedium,
                          child: Text(
                            item.title,
                            style: AppStyle.titleInkwellCard(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
