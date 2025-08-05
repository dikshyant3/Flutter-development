import 'package:flutter/material.dart';

enum LoyaltyLevelType {
  bronze,
  silver,
  gold,
}

class LoyaltyLevel {
  final LoyaltyLevelType type;
  final String name;
  final Color color;

  LoyaltyLevel({
    required this.type,
    required this.name,
    required this.color,
  });
}