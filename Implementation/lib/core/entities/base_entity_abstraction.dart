import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:zamaan/core/utils/uuid.dart';

/// An abstract base class for entities, providing common fields and functionality.
///
/// This class extends `HiveObject` and mixes in `EquatableMixin` to provide
/// equality comparison.
///
///  It includes the following fields:
/// - `id`: The unique identifier for the entity, automatically generated if not provided.
/// - `order`: An integer value used for organizing and prioritizing sub items.
/// - `creatorId`: The ID of the creator of the entity, if any.
/// - `createdAt`: The timestamp when the entity was created, automatically set if not provided.
/// - `description`: A description of the entity, if any.
abstract class BaseEntityAbstraction extends HiveObject with EquatableMixin {
  /// The unique identifier for the entity.
  ///
  /// This field is automatically generated using `uuidGenerator` if not provided.
  @HiveField(0)
  final String id;

  /// The order field is crucial for organizing and prioritizing sub items.
  ///
  /// A lower integer value in order indicates a higher priority sub item.
  /// This allows efficient management of items by sorting or displaying
  /// them based on their order values.
  @HiveField(100)
  final int order;

  /// The ID of the creator of the entity, if any.
  @HiveField(1)
  final String? creatorId;

  /// The timestamp when the entity was created.
  ///
  /// This field is automatically set to the current date and time if not provided.
  @HiveField(2)
  final DateTime createdAt;

  /// A description of the entity, if any.
  @HiveField(3)
  final String? description;

  /// Creates a new `BaseEntityAbstraction` with the specified properties.
  ///
  /// The `id` and `createdAt` fields are automatically generated if not provided.
  /// The `order`, `creatorId`, and `description` fields are optional.
  BaseEntityAbstraction({
    String? id,
    DateTime? createdAt,
    this.order = 0,
    this.creatorId,
    this.description,
  })  : id = id ?? uuidGenerator(),
        createdAt = createdAt ?? DateTime.now();
}
