import 'package:go_router/go_router.dart';
import 'package:habits_tracker_app/features/bottom_nav/screens/activity_screen.dart';
import 'package:habits_tracker_app/features/bottom_nav/screens/explore_screen.dart';
import 'package:habits_tracker_app/features/home/home_screen.dart';
import 'package:habits_tracker_app/features/bottom_nav/screens/main_shell.dart';
import 'package:habits_tracker_app/features/bottom_nav/screens/profile_screen.dart';
import 'package:habits_tracker_app/features/onboarding/screens/create_account/create_account_shell.dart';
import 'package:habits_tracker_app/features/onboarding/screens/create_account/enter_information_screen.dart';
import 'package:habits_tracker_app/features/onboarding/screens/create_account/select_gender_screen.dart';
import 'package:habits_tracker_app/features/onboarding/screens/create_account/select_habits_screen.dart';
import 'package:habits_tracker_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:habits_tracker_app/features/user_authentication/login_screen.dart';

class AppRoutes {
  static const String home = "/bottom_nav/home";
  static const String explore = "/bottom_nav/explore";
  static const String activity = "/bottom_nav/activity";
  static const String profile = "/bottom_nav/profile";
  static const String createAccountStep1 = "/create_account/enter_info";
  static const String createAccountStep2 = "/create_account/select_gender";
  static const String createAccountStep3 = "/create_account/select_habits";
  static const String createAccountFlow = "/createAccountFlow";
  static const String onboarding = "/onboarding";
  static const String auth = "/auth";
  static const String main = "/main";

  static final List<String> bottomNavRoutes = [
    home,
    explore,
    activity,
    profile,
  ];

  static GoRouter create(bool hasSeenOnboarding) {
    return GoRouter(
      initialLocation: hasSeenOnboarding ? AppRoutes.auth : AppRoutes.home,
      /*   redirect: (context, state) {
        final loggedIn = false; // TODO replace with real auth state

        // User did not finish onboarding
        if (!hasSeenOnboarding && state.uri.toString() != onboarding) {
          return onboarding;
        }

        // User finished onboarding but is not logged in
        if (hasSeenOnboarding &&
            !loggedIn &&
            state.uri.toString().startsWith(main)) {
          return auth;
        }

        return null;
      } ,*/
      routes: [
        // Onboarding flow
        GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        // Auth flow
        GoRoute(
          path: AppRoutes.auth,
          builder: (context, state) => const LoginScreen(),
        ),

        // Create Account Flow (nested)
        ShellRoute(
          builder: (context, state, child) => CreateAccountShell(child: child),
          routes: [
            GoRoute(
              path: AppRoutes.createAccountStep1,
              builder: (context, state) => EnterInformationScreen(),
            ),
            GoRoute(
              path: AppRoutes.createAccountStep2,
              builder: (context, state) => SelectGenderScreen(),
            ),
            GoRoute(
              path: AppRoutes.createAccountStep3,
              builder: (context, state) => SelectHabitsScreen(),
            ),
          ],
        ),
        // Main app flow with bottom navigation
        ShellRoute(
          builder: (context, state, child) => MainShell(child: child),
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => HomeScreen(),
            ),
            GoRoute(
              path: AppRoutes.explore,
              builder: (context, state) => ExploreScreen(),
            ),
            GoRoute(
              path: AppRoutes.activity,
              builder: (context, state) => ActivityScreen(),
            ),
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
