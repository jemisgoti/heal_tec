import 'dart:math';

import 'package:flutter/material.dart';
import 'package:heal_tec/src/core/widgets/input_box.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:heal_tec/src/core/theme/assets.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/core/widgets/text_widgets.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        height: MediaQuery.of(context).padding.top + 48 + 54,
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
            Positioned.fill(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        hintText: 'Search Doctor. . .',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        focusColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          borderSide: const BorderSide(color: grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          borderSide: const BorderSide(color: grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          borderSide: const BorderSide(color: grey),
                        ),
                        prefixIcon: const Icon(
                          IconlyLight.search,
                          color: Colors.white,
                        ),
                        suffixIcon: const Icon(
                          IconlyBold.filter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(218);
}

class AppointmentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppointmentAppBar({super.key});

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 48 + mainMargin,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 40,
                margin: const EdgeInsets.only(left: mainMargin),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: textGrey,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    IconlyLight.arrow_left_2,
                    size: 24,
                    color: black,
                  ),
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 12,
        title: const Text(
          'My Appointment',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xff101010),
            height: 24 / 16,
          ),
          textAlign: TextAlign.left,
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
