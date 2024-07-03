import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/data/models.dart';

part 'tag_model.g.dart';

/// It depends on the type of use of each person\
/// and each person can have his/her own\
/// use of tags, but the following example\
/// explains the best way.\
/// \
/// For example : programming as a task\
/// is placed in the job group\
/// and tags can be used to specify the\
/// type of language (C#, Pyton, PHP ,...) or work eara
@HiveType(typeId: 7)
class TagModel extends HiveObject {
  @HiveField(0)
  final String id;

  /// Default and predefined tags don't have creatorId
  @HiveField(1)
  final UserModel? creator;

  @HiveField(2)
  final String tagName;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final Color color;

  @HiveField(5)
  final IconData icon;

  TagModel(
      {required this.id,
      required this.creator,
      required this.tagName,
      required this.description,
      required this.color,
      required this.icon});

//TODO Manipulate the creator correctly
  TagModel.create({
    required this.tagName,
    required this.color,
    required this.icon,
    this.description,
  })  : id = const Uuid().v4(),
        creator = UserModel.create(
            userName: 'userName',
            password: 'password',
            firstName: 'firstName',
            lastName: 'lastName',
            birthDate: DateTime.now(),
            emailAddress: 'emailAddress',
            profileImagePath: 'profileImagePath');
}
