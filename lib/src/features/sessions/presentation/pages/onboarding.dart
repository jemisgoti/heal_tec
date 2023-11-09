import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:heal_tec/src/core/theme/assets.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/core/widgets/buttons.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/dashboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void onFirstRun() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    onFirstRun();
  }

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -120,
                    right: -120,
                    child: Transform.rotate(
                      angle: pi * 142.7 / 180,
                      child: Container(
                        // transform: Matrix4.rotationY(143 * pi / 180),
                        height: 64,
                        color: Colors.white.withOpacity(0.1),
                        width: 1200,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -120,
                    right: -120,
                    top: 210,
                    child: Transform.rotate(
                      angle: pi * 142.7 / 180,
                      child: Container(
                        // transform: Matrix4.rotationY(143 * pi / 180),
                        height: 64,
                        color: Colors.white.withOpacity(0.1),
                        width: 1200,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -120,
                    right: -120,
                    top: 450,
                    child: Transform.rotate(
                      angle: pi * 142.7 / 180,
                      child: Container(
                        // transform: Matrix4.rotationY(143 * pi / 180),
                        height: 64,
                        color: Colors.white.withOpacity(0.1),
                        width: 1200,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      AssetPath.onboardingDoctor,
                      width: 295,
                      height: 458.70,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              width: MediaQuery.sizeOf(context).width,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    child: PageView.builder(
                      controller: controller,
                      itemBuilder: (BuildContext context, int index) =>
                          const Column(
                        children: <Widget>[
                          Text(
                            'More Comfortable Chat With the Doctor',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF0F0F0F),
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(8),
                          Text(
                            'Book an appointment with doctor. Chat with doctor via appointment letter and get consultationt.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(24),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      radius: 8,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 4,
                      activeDotColor: primaryColor,
                      dotColor: Color(0xFFDFE0F3),
                    ),
                  ),
                  const Gap(24),
                  PrimaryButton(
                    onTap: onButtonPress,
                    title: 'Get Started',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  void onButtonPress() {
    final double page = controller.page!;
    debugPrint(page.toString());
    if (page < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    } else {
      context.go(DashBoard.routeName);
    }
  }
}
