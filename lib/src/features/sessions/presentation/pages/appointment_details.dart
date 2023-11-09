import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/core/widgets/buttons.dart';
import 'package:heal_tec/src/core/widgets/text_widgets.dart';
import 'package:heal_tec/src/features/sessions/data/models/doctor_model.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/call_screen.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/appbar.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/medicines.dart';
import 'package:iconly/iconly.dart';

class AppointMentDetails extends StatelessWidget {
  const AppointMentDetails({required this.doctor, super.key});
  final Doctor doctor;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const AppointmentAppBar(),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: <Widget>[
                  DoctorInfo(doctor: doctor),
                  const Gap(16),
                  DoctorStats(doctor: doctor),
                  const Gap(16),
                  const Text(
                    'About Me',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff101010),
                      height: 24 / 16,
                    ),
                  ),
                  const Gap(8),
                  const Text(
                    'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. She achived several awards for her wonderful contribution Read More. . . ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      height: 18 / 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(24),
                  const Text(
                    'Patient Information ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff101010),
                      height: 24 / 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Gap(subMargin),
                  const Text(
                    'Full Name : Richard Lee',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff878787),
                      height: 20 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Gap(8),
                  const Text(
                    'Gendre  : Male',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff878787),
                      height: 20 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: PrimaryButton(
                icon: IconlyBold.call,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          CallScreen(doctor: doctor),
                    ),
                  );
                },
                title: 'Start Voice Call (14.30 - 15.00 PM)',
              ),
            ),
          ],
        ),
      );
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({required this.doctor, super.key});
  final Doctor doctor;
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0x2222220A).withOpacity(0.04),
              offset: const Offset(
                0,
                4,
              ),
              blurRadius: 16,
            ),
          ],
        ),
        height: 198 + 70,
        width: (MediaQuery.sizeOf(context).width - 3 * mainMargin) / 2,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset(
                      doctor.image,
                      height: 198,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width - 2 * mainMargin,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Text(
                              'Dr. Elia Ana',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff101010),
                                height: 24 / 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFFD33C),
                            ),
                            const Gap(8),
                            Text(
                              '${doctor.star} (332 reviews)',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff101010),
                                height: 18 / 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Gap(4),
                        const Text(
                          'Cardiologists | Mars Hospital',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff878787),
                            height: 18 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  IconlyBold.heart,
                  color: primaryColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      );
}

class DoctorStats extends StatelessWidget {
  const DoctorStats({required this.doctor, super.key});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) => const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stats(icon: IconlyBold.user_2, title: 'Patients', value: '658+'),
          Stats(icon: IconlyBold.activity, title: 'Years expert', value: '11+'),
          Stats(icon: IconlyBold.star, title: 'Years expert', value: '5.0'),
          Stats(icon: IconlyBold.chat, title: 'Reviews', value: '300+'),
        ],
      );
}

class Stats extends StatelessWidget {
  const Stats({
    required this.icon,
    required this.title,
    required this.value,
    super.key,
  });
  final String title;
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 73,
        child: Column(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5F5FF),
              ),
              child: Icon(
                icon,
                size: 20,
                color: primaryColor,
              ),
            ),
            const Gap(9),
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff101010),
                height: 24 / 16,
              ),
              textAlign: TextAlign.left,
            ),
            const Gap(3),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff878787),
                height: 18 / 12,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      );
}
