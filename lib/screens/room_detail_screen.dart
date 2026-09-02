import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/config/utils/context_utils.dart';

import '../config/app_style.dart';
import '../config/constants/app_dimensions.dart';
import '../data/models/room.dart';

class RoomDetailScreen extends StatelessWidget {
  final Room selectedRoom;

  const RoomDetailScreen({super.key, required this.selectedRoom});

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: height * AppDimensions.imageDetailHeightRatio,
                    child: Image.asset(
                      selectedRoom.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 16,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: context.colorScheme.onPrimary),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        }
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: context.colorScheme.onSurface.withAlpha(150),
                        // shape: const CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.spaceMedium),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spaceMedium),
                child: SizedBox(
                  height: height * AppDimensions.contentDetailHeightRatio,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          selectedRoom.title,
                          style: AppStyle.homeSectiontitle(context),
                        ),
                      ),
                      SizedBox(height: AppDimensions.spaceMedium),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          selectedRoom.description,
                          style: AppStyle.body(context),
                        ),
                      ),
                      SizedBox(height: AppDimensions.spaceExtraLarge),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Prix: ${selectedRoom.price} FCFA',
                          style: AppStyle.titleText(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimensions.spaceLarge),
        child: SizedBox(
          height: 50,
          child: FilledButton(
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton
            },
            child: const Text('Réserver'),
          ),
        ),
      ),
    );
  }
}
