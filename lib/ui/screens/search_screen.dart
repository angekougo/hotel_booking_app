import 'package:flutter/material.dart';
import 'package:hotel_booking_app/config/constants/app_dimensions.dart';
import '../../config/app_style.dart';
import '../../config/constants/app_breakpoints.dart';
import '../../config/constants/app_strings.dart';
import '../../data/mocks/mock_data.dart';
import '../../data/models/room.dart';
import '../widgets/custom_card_for_vertical_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Room> rooms = MockData.getInkWellCarrouselData();
  List<Room> _foundRooms = [];

  @override
  void initState() {
    _foundRooms = rooms;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Room> results = [];
    if (enteredKeyword.isEmpty) {
      results = rooms;
    } else {
      results = rooms
          .where((room) =>
              room.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundRooms = results;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spaceMedium,
                vertical: AppDimensions.spaceLarge),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.searchPageTitle,
                    style: AppStyle.display(context),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.spaceMedium,
                ),
                TextField(
                  onChanged: _runFilter,
                  decoration: InputDecoration(
                    labelText: AppStrings.searchLabelText,
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusSmall),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.spaceMedium,
                ),
                Expanded(
                  child: _foundRooms.isNotEmpty
                      ? LayoutBuilder(builder: (context, constraints) {
                          if (constraints.maxWidth >= AppBreakpoints.tablet) {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: AppDimensions.crossAxisCountTablet,
                                childAspectRatio: AppDimensions.childAspectRatioTablet,
                                crossAxisSpacing: AppDimensions.spaceMedium,
                                mainAxisSpacing: AppDimensions.spaceMedium,
                              ),
                              itemCount: _foundRooms.length,
                              itemBuilder: (context, index) {
                                return CustomCardForVerticalList(
                                    room: _foundRooms[index]);
                              },
                            );
                          } else {
                            return ListView.builder(
                              itemCount: _foundRooms.length,
                              itemBuilder: (context, index) {
                                return CustomCardForVerticalList(
                                    room: _foundRooms[index]);
                              },
                            );
                          }
                        })
                      : const Text(
                          AppStrings.searchNoResultsText,
                          style: TextStyle(fontSize: 18),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
