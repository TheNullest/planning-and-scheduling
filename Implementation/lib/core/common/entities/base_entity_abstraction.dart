import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:zamaan/core/utils/uuid.dart';

/// An abstract base class for entities, providing common fields and functionality.
///
/// This class extends `HiveObject` and mixes in `EquatableMixin` to provide
/// equality comparison.
///
/// It includes the following fields:
/// - `id`: The unique identifier for the entity, automatically generated if not provided.
/// - `order`: An integer value used for organizing and prioritizing sub items.
/// - `userId`: The ID of the creator of the entity, if any.
/// - `createdAt`: The timestamp when the entity was created, automatically set if not provided.
/// - `description`: A description of the entity, if any.
/// - `updatedAt`: The timestamp when the entity was last updated, can be null if not updated.
abstract class BaseEntityAbstraction extends HiveObject with EquatableMixin {
  /// Creates a new `BaseEntityAbstraction` with the specified properties.
  ///
  /// The `id` and `createdAt` fields are automatically generated if not provided.
  /// The `order`, `userId`, and `description` fields are optional.
  BaseEntityAbstraction({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.userId,
    this.description,
  })  : id = id ?? uuidGenerator(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  /// The unique identifier for the entity.
  ///
  /// This field is automatically generated using `uuidGenerator` if not provided.
  @HiveField(0)
  final String id;

  /// The ID of the creator of the entity, if any.
  @HiveField(1)
  final String? userId;

  /// The timestamp when the entity was created.
  ///
  /// This field is automatically set to the current date and time if not provided.
  @HiveField(2)
  final DateTime createdAt;

  /// A description of the entity, if any.
  @HiveField(3)
  final String? description;

  /// The timestamp when the entity was last updated.
  ///
  /// This field can be null if the entity has not been updated since creation,
  /// it should be set when the entity is updated.
  @HiveField(100)
  final DateTime? updatedAt;

  /// Creates a copy of this class with potentially modified properties.
  ///
  /// The `copyWith` method allows you to create a new instance of the class
  /// with some properties modified while keeping the rest unchanged.
  BaseEntityAbstraction copyWith();
}
