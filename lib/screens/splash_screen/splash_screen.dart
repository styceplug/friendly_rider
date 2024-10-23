import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:friendly_rider/routes/routes.dart';
import 'package:friendly_rider/utils/app_constants.dart';
import 'package:friendly_rider/utils/colors.dart';
import 'package:friendly_rider/utils/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    Timer(
      const Duration(seconds: 5),
      () => Get.offAllNamed(AppRoutes.loginScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height70,
              width: Dimensions.width70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppConstants.getGifAsset('location')),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Friendly Rider\'s App',
                  textStyle: TextStyle(
                    color: AppColors.primaryColor,
                      fontSize: Dimensions.font22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ],
        ),
      ),
    );
  }
}
