import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({required this.icon, required this.title, super.key});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black.withAlpha(150),
            ),
            const Gap(mainMargin),
            Text(
              title,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: Color(0xff878787),
            ),
          ],
        ),
      );
}
