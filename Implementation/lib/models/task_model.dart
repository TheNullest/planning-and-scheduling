import 'package:flutter/material.dart';

class TaskModel {
  final int taskId;
  final int creatorId;
  final List<int>? contributorsId;
  final String taskName;
  final String? description;
  final int? parentId;
  final List<int> fixedTagsId;
  final DateTime dateCreated;
  final DateTime? deadline;
  final Color color;
  final IconData icon;
  final int priority;

  TaskModel({
    required this.taskId,
    required this.creatorId,
    this.contributorsId,
    required this.taskName,
    required this.fixedTagsId,
    required this.dateCreated,
    required this.color,
    required this.icon,
    required this.priority,
    this.description,
    this.parentId,
    this.deadline,
  });
}
