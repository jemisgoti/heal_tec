import 'package:flutter/material.dart';
import 'package:heal_tec/src/core/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onTap,
    required this.title,
    this.icon,
    super.key,
  });
  final VoidCallback onTap;
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          minimumSize:
              const MaterialStatePropertyAll<Size>(Size(double.maxFinite, 52)),
          backgroundColor: const MaterialStatePropertyAll<Color>(primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Icon(
                  icon,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
}
