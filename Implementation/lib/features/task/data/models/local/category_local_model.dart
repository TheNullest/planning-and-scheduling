import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';

part 'category_local_model.g.dart';

@HiveType(typeId: 2) // Unique ID for Hive
class CategoryLocalModel extends CategoryEntity {
  CategoryLocalModel({
    required super.title,
    required super.colorCode,
    required super.iconCode,
    super.id,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.userId,
  });

  // For the purpose of testing
  CategoryLocalModel.empty() : super.empty();

  factory CategoryLocalModel.fromEntity(CategoryEntity entity) =>
      CategoryLocalModel(
        id: entity.id,
        description: entity.description,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        userId: entity.userId,
        title: entity.title,
        colorCode: entity.colorCode,
        iconCode: entity.iconCode,
      );

  /// Creates a copy of this CategoryEntity with potentially modified properties.
  @override
  CategoryLocalModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
  }) =>
      CategoryLocalModel(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        colorCode: colorCode ?? this.colorCode,
        iconCode: iconCode ?? this.iconCode,
      );
}
