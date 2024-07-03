import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/services/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splash: Text(
          'East',
          style: TextStyle(
            fontFamily: 'Logo',
            fontSize: 64,
            color: white,
            fontWeight: FontWeight.w900,
          ),
        ),
        nextScreen: const AuthPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.theme,
        backgroundColor: orange2);
  }
}
