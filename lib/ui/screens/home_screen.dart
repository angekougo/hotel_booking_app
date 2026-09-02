import 'package:flutter/material.dart';
import 'package:hotel_booking_app/config/app_style.dart';
import 'package:hotel_booking_app/config/constants/app_dimensions.dart';
import 'package:hotel_booking_app/config/constants/app_images.dart';
import 'package:hotel_booking_app/config/constants/app_strings.dart';
import 'package:hotel_booking_app/config/utils/context_utils.dart';
import 'package:hotel_booking_app/data/models/room.dart';
import 'package:hotel_booking_app/ui/widgets/custom_card_for_vertical_list.dart';
import 'package:hotel_booking_app/ui/widgets/custom_horizontal_inkwell_carrousel.dart';
import 'package:hotel_booking_app/ui/widgets/home_section_title.dart';

import '../../data/mocks/mock_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    final width = context.screenWidth;

    final List<Room> items = MockData.getInkWellCarrouselData();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height * AppDimensions.imageHomeHeightRatio,
                  child: Image.asset(
                    AppImages.homeImage,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: AppDimensions.spaceExtraLarge,
                  left: AppDimensions.spaceMedium,
                  child: SizedBox(
                    width: width * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.mainWelcomeText1,
                          style: AppStyle.displayWhiteWhithShadow(context),
                        ),
                        Text(
                          AppStrings.mainWelcomeText2,
                          style: AppStyle.displayWhiteWhithShadow(context),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.06,
                  left: AppDimensions.spaceLarge,
                  right: AppDimensions.spaceLarge,
                  child: SearchAnchor(
                    builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: controller,

                        onTap: () {
                          controller
                              .openView(); // Ouvre la vue des suggestions au clic
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading:
                            const Icon(Icons.search), // Icône loupe à gauche
                        hintText: 'Rechercher...',
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'Suggestion $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            controller.closeView(
                                item); // Ferme la vue et remplit le champ
                          },
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimensions.spaceMedium,
                  right: AppDimensions.spaceMedium),
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimensions.spaceMedium,
                  ),
                  HomeSectionTitle(
                    title: AppStrings.titleRoomsSection,
                  ),
                  SizedBox(
                    height: AppDimensions.spaceMedium,
                  ),
                  CustomHorizontalInkwellCarrousel(items: items),
                  SizedBox(
                    height: AppDimensions.spaceMedium,
                  ),
                  HomeSectionTitle(title: AppStrings.titleMostInDemandSection),
                  SizedBox(
                    height: AppDimensions.spaceMedium,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.only(bottom: AppDimensions.spaceLarge),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return CustomCardForVerticalList(room: items[index]);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
