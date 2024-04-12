import 'package:flutter/material.dart';
import 'package:zamaan/model/group_model.dart';
import 'package:zamaan/model/main_task_model.dart';

/// It depends on the type of use of each person\
/// and each person can have his/her own\
/// use of tags, but the following example\
/// explains the best way.\
/// \
/// For example : programming as a task\
/// is placed in the job group\
/// and tags can be used to specify the\
/// type of language (C#, Pyton, PHP ,...) or work eara
class TagModel {
  final int id;

  /// Default and predefined tags don't have creatorId
  final int? creatorId;
  final String tagName;
  final String? description;
  final Color color;
  final IconData icon;

  /// The tag is displayed for the specified groups
  final List<GorupModel>? groupsId;

  /// The tag is displayed for the specified task
  final List<MainTaskModel>? tasksId;

  TagModel({
    required this.id,
    required this.tagName,
    required this.color,
    required this.icon,
    this.creatorId,
    this.description,
    this.groupsId,
    this.tasksId,
  });
}
