import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/config/constants/app_images.dart';
import 'package:hotel_booking_app/config/constants/app_routes.dart';
import 'package:hotel_booking_app/data/models/onboarding_item.dart';
import 'package:hotel_booking_app/ui/screens/login_screen.dart';
import 'package:hotel_booking_app/ui/screens/main_navigation.dart';
import 'package:hotel_booking_app/ui/screens/onboarding_screen.dart';
import 'package:hotel_booking_app/ui/screens/signup_screen.dart';

import '../../data/models/room.dart';
import '../../ui/screens/room_detail_screen.dart';
import '../constants/app_strings.dart';

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: AppRoutes.onboardingPath,
    routes: [
      GoRoute(
        path: AppRoutes.mainPath,
        builder: (context, state) => const MainNavigation(),
      ),
      GoRoute(
        path: AppRoutes.loginPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signupPath,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingPath,
        builder: (context, state) {
          List<OnboardingItem> datas = [
            OnboardingItem(
              title: AppStrings.onboardTitleOne,
              description: AppStrings.onboardParagraphOne,
              imagePath: AppImages.onboarding1,
            ),
            OnboardingItem(
              title: AppStrings.onboardTitleTwo,
              description: AppStrings.onboardParagraphTwo,
              imagePath: AppImages.onboarding2,
            ),
            OnboardingItem(
              title: AppStrings.onboardTitleThree,
              description: AppStrings.onboardParagraphThree,
              imagePath: AppImages.onboarding3,
            )
          ];

          return OnboardingScreen(
            items: datas,
            onFinish: () {
              context.push('/login');
            },
          );
        },
      ),
      GoRoute(
      path: AppRoutes.roomDetailPath,
      builder: (context, state) {
        final roomObject = state.extra as Room;
        return RoomDetailScreen(selectedRoom: roomObject);
      },
    ),
    ],
  );
}
