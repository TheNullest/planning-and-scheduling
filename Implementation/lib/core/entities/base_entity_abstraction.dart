import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

abstract class BaseEntityAbstraction extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? creatorId;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final String? description;

  BaseEntityAbstraction({
    String? id,
    required this.createdAt,
    this.creatorId,
    this.description,
  }) : id = id ?? const Uuid().v4();

  /// For use int the base repository
  // BaseEntityAbstraction.empty()
  //     : this(
  //           id: '1',
  //           description: '_empty.description',
  //           createdAt: DateTime.now());

  /// Just for the HiveUserModel helper using in the base repository
  BaseEntityAbstraction toEntity();

  /// Just for the HiveUserModel helper using in the base repository
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity);
}
