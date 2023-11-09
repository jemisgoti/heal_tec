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

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
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
            const Row(
              children: <Widget>[
                Text(
                  'Favourite Doctor',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff101010),
                    height: 24 / 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4c4ddc),
                    height: 20 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const Gap(16),
            SizedBox(
              height: 154,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    selected = index;
                    setState(() {});
                  },
                  child: _Doctor(
                    isSelected: index == selected,
                    doctor: doctors[index % 2],
                  ),
                ),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const Gap(16),
              ),
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
          height: 150,
          width: (MediaQuery.sizeOf(context).width - 3 * mainMargin) / 2,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Column(
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
                        width: (MediaQuery.sizeOf(context).width -
                                3 * mainMargin) /
                            2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                doctor.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff101010),
                                  height: 20 / 14,
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
                                doctor.star.toString(),
                                style: const TextStyle(
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
                          Text(
                            '${doctor.specialist} - Hospital',
                            style: const TextStyle(
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
              const Positioned(
                top: 5,
                right: 5,
                child: Icon(
                  IconlyBold.heart,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
}
