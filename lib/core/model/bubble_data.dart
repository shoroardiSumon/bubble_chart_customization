import 'package:flutter/material.dart';

class BubbleData {
  final int id;
  final String name;
  final double value;
  final Color color;

  double get size => value;

  BubbleData({
    required this.id,
    required this.name,
    required this.value,
    required this.color,
  });
}
