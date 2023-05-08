import 'package:flutter/material.dart';

class AchievementModel {
  final IconData achIcon;
  final String achReached;
  final int progress;
  final int target;

  AchievementModel({
    required this.achIcon,
    required this.achReached,
    required this.progress,
    required this.target,
  });
}

List<AchievementModel> achievementModel = [
  AchievementModel(
      achIcon: Icons.bookmark,
      achReached: 'Clear 1 Quiz',
      progress: 0,
      target: 1),
  AchievementModel(
      achIcon: Icons.money,
      achReached: 'Spend 200 points',
      progress: 0,
      target: 200),
  AchievementModel(
      achIcon: Icons.bookmark,
      achReached: 'Clear 5 Quiz',
      progress: 0,
      target: 5),
];
