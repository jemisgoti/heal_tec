import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal_tec/src/core/theme/colors.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  int selected = 0;

  List<String> symptoms = <String>[
    '🤧 Snuffle',
    '🤒 High Fever',
    '🤮 Nauseous',
  ];
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Your symptoms ❓',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(16),
            SizedBox(
              height: 37,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    selected = index;
                    setState(() {});
                  },
                  child: _Symptoms(
                    isSelected: index == selected,
                    title: symptoms[index],
                  ),
                ),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const Gap(8),
                itemCount: 3,
              ),
            ),
          ],
        ),
      );
}

class _Symptoms extends StatelessWidget {
  const _Symptoms({required this.isSelected, required this.title});
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? primaryColor : Colors.white,
        ),
        height: 37,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 21 / 14,
              color: isSelected ? Colors.white : const Color(0xFFA0A6B1),
            ),
          ),
        ),
      );
}
