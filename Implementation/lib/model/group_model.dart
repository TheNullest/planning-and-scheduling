import 'package:flutter/material.dart';

/// Groups such as : sport, reading, working, fun ,...
class GorupModel {
  final int id;

  /// Default and predefined groups don't have creatorId
  final int? creatorId;
  final String groupName;
  final String? description;
  final Color color;
  final IconData icon;

  GorupModel({
    required this.id,
    required this.groupName,
    required this.color,
    required this.icon,
    this.description,
    this.creatorId,
  });
}
