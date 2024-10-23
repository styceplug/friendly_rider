import 'package:friendly_rider/screens/additional_screens/privacy_policy_screen.dart';
import 'package:friendly_rider/screens/additional_screens/terms_of_service.dart';
import 'package:friendly_rider/screens/auth_screen/login_screen.dart';
import 'package:friendly_rider/screens/main_screens/dashboard_screen.dart';
import 'package:friendly_rider/screens/main_screens/notification_screen.dart';
import 'package:friendly_rider/screens/splash_screen/splash_screen.dart';
import 'package:friendly_rider/widgets/floating_bar.dart';
import 'package:friendly_rider/widgets/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash-screen';
  static const String loginScreen = '/login-screen';
  static const String dashboardScreen = '/dashboard-screen';
  static const String homeScreen = '/home-screen';
  static const String privacyPolicyScreen = '/privacy-policy-screen';
  static const String termsOfService = '/terms-of-service-screen';
  static const String floatingBar = '/floating-bar';
  static const String notificationScreen = '/notification-screen';


  static final routes = [
    GetPage(
      name: homeScreen,
      page: () {
        final int startingPage = Get.arguments as int;
        return HomeScreen(
          startingPage: startingPage,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: splashScreen,
      page: () {
        return const SplashScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: loginScreen,
      page: () {
        return const LoginScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: dashboardScreen,
      page: () {
        return const DashboardScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () {
        return const PrivacyPolicyScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: termsOfService,
      page: () {
        return const TermsOfServices();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: floatingBar,
      page: () {
        return const FloatingBar();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: notificationScreen,
      page: () {
        return const NotificationScreen();
      },
      transition: Transition.fadeIn,
    ),

  ];
}