import 'package:hive/hive.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';

/// Represents a category for tasks or activities.
/// Examples of categories include: Sport, Reading, Working, Fun, etc.
class CategoryEntity extends BaseEntityAbstraction {
  CategoryEntity({
    required this.title,
    required this.colorCode,
    required this.iconCode,
    super.id,
    super.createdAt,
    super.userId,
    super.updatedAt,
    super.description,
  });

  CategoryEntity.empty() : this(title: 'title', colorCode: 1, iconCode: 2);

  @HiveField(4)
  final String title;

  @HiveField(5)
  final int colorCode;

  @HiveField(6)
  final int iconCode;

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userId: userId,
        title: title,
        colorCode: colorCode,
        iconCode: iconCode,
      );

  @override
  CategoryEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
  }) =>
      CategoryEntity(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        colorCode: colorCode ?? this.colorCode,
        iconCode: iconCode ?? this.iconCode,
      );

  @override
  List<Object?> get props => [
        id,
        createdAt,
        userId,
        updatedAt,
        description,
        title,
        colorCode,
        iconCode,
      ];
}
