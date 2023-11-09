import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:heal_tec/src/core/theme/assets.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/dashboard.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/welconme';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
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
    initialize();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.dispose();
  }

  late Animation<double> animation;
  late AnimationController animationController;

  void initialize() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward().then((dynamic value) {
      context.go(OnboardingScreen.routeName);
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget? child) => Image.asset(
                    AssetPath.logo,
                    width: 50 + (animation.value) * 50,
                    height: 50 + (animation.value) * 50,
                  ),
                ),
                const SizedBox(
                  height: subMargin * 4,
                ),
                SizedBox(
                  width: 150,
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget? child) =>
                        LinearProgressIndicator(
                      color: primaryColor,
                      value: animation.value,
                      borderRadius: BorderRadius.circular(4),
                      backgroundColor: const Color(0xFFDFE0F3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void onButtonPress() {
    context.go(DashBoard.routeName);
  }
}
