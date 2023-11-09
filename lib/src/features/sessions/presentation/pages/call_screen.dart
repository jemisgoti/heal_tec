import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:heal_tec/src/core/theme/assets.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/features/sessions/data/models/doctor_model.dart';
import 'package:iconly/iconly.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({required this.doctor, super.key});
  final Doctor doctor;
  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    super.initState();
  }

  late Timer timer;
  void setAppBar({bool dark = false}) {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      int second = secconds.value;
      second++;
      secconds.value = second;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  ValueNotifier<int> secconds = ValueNotifier(0);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0x00020919), Color(0xff020219)],
                ),
                image: DecorationImage(image: AssetImage(AssetPath.doctor4)),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0x00020919), Color(0xff020219)],
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    AssetPath.doctor4Cover,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const Gap(mainMargin),
                  const Text(
                    'Dr. Carly Angel',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 26 / 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Gap(mainMargin),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          width: 8,
                          height: 8,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFD93A3A),
                            ),
                          ),
                        ),
                        const Gap(8),
                        ValueListenableBuilder<int>(
                          valueListenable: secconds,
                          builder: (
                            BuildContext context,
                            int value,
                            Widget? child,
                          ) =>
                              const Text(
                            '19 : 00 Minute',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff101010),
                              height: 18 / 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 25,
              child: Footer(),
            ),
          ],
        ),
      );
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: const Icon(
              IconlyBold.volume_up,
              color: primaryColor,
              size: 22,
            ),
          ),
          const Gap(24),
          FloatingActionButton(
            onPressed: () {
              context.pop();
            },
            backgroundColor: Colors.white,
            child: const Icon(
              IconlyBold.call_missed,
              color: Colors.red,
              size: 22,
            ),
          ),
          const Gap(24),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: const Icon(
              IconlyBold.voice,
              color: primaryColor,
              size: 22,
            ),
          ),
        ],
      );
}
