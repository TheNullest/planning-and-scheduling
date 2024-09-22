import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

abstract class BaseEntityAbstraction extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;

  /// The [order] field is crucial for organizing and prioritizing sub items.\
  /// A lower integer value in order indicates a higher priority sub item.\
  /// This allows to efficiently manage items by sorting or displaying\
  /// them based on their order values.
  @HiveField(100)
  final int? order;

  @HiveField(1)
  final String? creatorId;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final String? description;

  BaseEntityAbstraction({
    String? id,
    DateTime? createdAt,
    this.order,
    this.creatorId,
    this.description,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  /// Just for the HiveModel helper using in the base repository
  BaseEntityAbstraction toEntity();

  /// Just for the HiveModel helper using in the base repository
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity);
}
