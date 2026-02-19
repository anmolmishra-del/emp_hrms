import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_images.dart';
import 'package:flutter_app/features/auth/login_screen.dart';
import 'package:flutter_app/features/home/presentation/home_page.dart';
import 'package:flutter_app/features/onboard/onboard_page.dart';
import 'package:flutter_app/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.getAll(),
      home: const OnboardingScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;

    if (!mounted) return;

    if (isLoggedIn) {
      // User already logged in
      Navigator.pushReplacementNamed(
        context,
        Routes.main,
      ); //ekkada user login unte direct ga homepage velthadu
    } else {
      // New / logged out user
      Navigator.pushReplacementNamed(
        context,
        Routes.main,
      ); // user firsttime login inapudu first onboard and logn and home page daniki sharepreference vadutha thats it
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 180,
          height: 180,
          child: Image.asset(AppImages.logo, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
