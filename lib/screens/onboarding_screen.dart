import 'package:flutter/material.dart';
import 'package:hotel_booking_app/config/app_style.dart';
import 'package:hotel_booking_app/config/constants/app_dimensions.dart';
import 'package:hotel_booking_app/data/models/onboarding_item.dart';

import '../config/constants/app_strings.dart';
import '../config/utils/context_utils.dart';
import '../widgets/onboarding_view.dart';

class OnboardingScreen extends StatefulWidget {
  final List<OnboardingItem> items;
  final VoidCallback onFinish;
  final String skipText;
  final String nextText;
  final String finishText;

  const OnboardingScreen({
    super.key,
    required this.items,
    required this.onFinish,
    this.finishText = AppStrings.finishText,
    this.nextText = AppStrings.nextText,
    this.skipText = AppStrings.skipText,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  bool get _isLastPage => _currentIndex == widget.items.length - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.items.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                return OnboardingView(item: widget.items[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.spaceLarge,
              right: AppDimensions.spaceLarge,
              bottom: AppDimensions.spaceExtraLarge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () =>
                      _pageController.jumpToPage(widget.items.length - 1),
                  child: Text(widget.skipText, style: AppStyle.body(context)),
                ),
                Row(
                  children: List.generate(
                    widget.items.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: AppDimensions.spaceSmall),
                      height: 8,
                      width: _currentIndex == index ? AppDimensions.spaceLarge : AppDimensions.spaceSmall,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? context.primaryColor
                            : context.secondaryColor,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                      ),
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    if (_isLastPage) {
                      widget.onFinish();
                    } else {
                      _pageController.nextPage(
                        duration: AppDimensions.animationDuration,
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _isLastPage ? widget.finishText : widget.nextText,
                    style: AppStyle.textButtonPrimary(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
