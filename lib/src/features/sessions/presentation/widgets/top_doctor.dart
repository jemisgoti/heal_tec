import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal_tec/src/core/theme/assets.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/features/sessions/data/models/doctor_model.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/appointment_details.dart';
import 'package:iconly/iconly.dart';

class TopDoctors extends StatefulWidget {
  const TopDoctors({super.key});

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  int selected = 0;

  List<Doctor> doctors = <Doctor>[
    Doctor(
      name: 'Dr. Friska',
      specialist: 'Utritionists',
      image: AssetPath.doctor1,
      star: 4.5,
    ),
    Doctor(
      name: 'Dr. Lidya Bey',
      specialist: 'Utritionists',
      image: AssetPath.doctor2,
      star: 4.5,
    ),
  ];
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Top Doctor',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff101010),
                    height: 24 / 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Spacer(),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff4c4ddc),
                    height: 20 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const Gap(16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  selected = index;
                  setState(() {});
                },
                child: _Doctor(
                  isSelected: index == selected,
                  doctor: doctors[index % 2],
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(16),
            ),
          ],
        ),
      );
}

class _Doctor extends StatelessWidget {
  const _Doctor({required this.isSelected, required this.doctor});
  final Doctor doctor;
  final bool isSelected;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute<dynamic>(
              builder: (BuildContext context) =>
                  AppointMentDetails(doctor: doctor),
            ),
          );
        },
        child: Container(
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
          height: 116,
          padding: const EdgeInsets.all(12),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset(
                      doctor.image,
                      height: 92,
                      fit: BoxFit.cover,
                      width: 92,
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Row(
                          children: <Widget>[
                            Text(
                              'Dr. Berlin Elizerd',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff101010),
                                height: 24 / 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            Icon(
                              IconlyBold.heart,
                              color: primaryColor,
                            ),
                          ],
                        ),
                        const Gap(8),
                        const Divider(
                          color: textGrey,
                          height: 1,
                          thickness: 1,
                        ),
                        const Gap(8),
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
                        const Gap(8),
                        Row(
                          children: <Widget>[
                            Icon(
                              isSelected ? Icons.star : Icons.star_outline,
                              color: const Color(0xFFFFD33C),
                            ),
                            const Gap(8),
                            const Text(
                              '4.7 (7.932 reviews)',
                              style: TextStyle(
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
