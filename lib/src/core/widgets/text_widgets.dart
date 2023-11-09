import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.text, {this.color, this.size, super.key});

  final String text;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) => Material(
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
            fontSize: size ?? 20,
            fontWeight: FontWeight.w500,
            color: color ?? Colors.black,
          ),
        ),
      );
}

class Paragrah extends StatelessWidget {
  const Paragrah(this.text, {this.color, this.size, super.key});
  final String text;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) => Material(
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
            fontSize: size ?? 16,
            fontWeight: FontWeight.w500,
            color: color ?? const Color(0xFF808080),
          ),
        ),
      );
}
