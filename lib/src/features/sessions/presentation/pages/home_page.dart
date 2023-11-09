import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:heal_tec/src/core/theme/assets.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/appbar.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/doctors.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/symptoms.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/top_doctor.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  void listenScrool() {
    scrollController.addListener(() {
      final double pos = scrollController.position.pixels;

      debugPrint('Pos: $pos');
    });
  }

  @override
  void initState() {
    super.initState();
    listenScrool();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 48 + mainMargin,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 48,
              height: 48,
              margin: const EdgeInsets.only(left: mainMargin),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.asset(AssetPath.profilePicture),
              ),
            ),
          ),
          centerTitle: false,
          titleSpacing: 12,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello, Welcome  🎉',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Leonardo thapinci',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 24 / 16,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xFFEDEDED).withOpacity(0.1),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      const Center(
                        child: Icon(
                          IconlyLight.notification,
                          size: 24,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD93A3A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: mainMargin,
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFFF7F7F7),
        body: ListView(
          controller: scrollController,
          padding: EdgeInsets.zero,
          children: const <Widget>[
            HomeHeader(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Symptoms(),
                  Gap(24),
                  Doctors(),
                  Gap(24),
                  TopDoctors(),
                ],
              ),
            ),
          ],
        ),
      );
}
