import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heal_tec/src/core/theme/colors.dart';

@immutable
class Event {
  const Event({this.title = 'Title', this.color = primaryColor});
  final String title;
  final Color color;

  @override
  bool operator ==(Object other) => other is Event && title == other.title;

  @override
  String toString() => title;
}
