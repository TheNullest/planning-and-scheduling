import 'package:flutter/material.dart';

class TagModel {
  final int tagId;
  final String tagName;
  final String? description;
  final Color color;
  final IconData icon;

  TagModel({
    required this.tagId,
    required this.tagName,
    required this.color,
    required this.icon,
    this.description,
  });
}
