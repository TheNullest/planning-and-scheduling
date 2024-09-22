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
    DateTime? createdAt,
    this.creatorId,
    this.description,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  /// Just for the HiveModel helper using in the base repository
  BaseEntityAbstraction toEntity();

  /// Just for the HiveModel helper using in the base repository
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity);
}
