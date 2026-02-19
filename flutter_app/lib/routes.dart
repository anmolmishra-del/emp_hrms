import 'package:flutter/widgets.dart';
import 'package:flutter_app/features/main/presentation/main_page.dart';
import 'package:flutter_app/features/onboard/onboard_page.dart';

class Routes {
  Routes._();
  static String onboarding = '/onboarding';
  static String main = '/main';
  static Map<String, WidgetBuilder> getAll() {
    return {
      onboarding: (c) => const OnboardingScreen(),
      main: (c) => MainPage(),
    };
  }
}
