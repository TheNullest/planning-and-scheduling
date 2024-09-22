import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';

/// Represents a category for tasks or activities.
/// Examples of categories include: Sport, Reading, Working, Fun, etc.
class CategoryEntity extends BaseEntityAbstraction {
  @HiveField(4)
  final String title;

  @HiveField(5)
  final int colorCode;

  @HiveField(6)
  final int iconCode;

  CategoryEntity({
    super.id,
    super.order,
    super.createdAt,
    super.creatorId,
    super.description,
    required this.title,
    required this.colorCode,
    required this.iconCode,
  });

  /// Creates a copy of this CategoryEntity with potentially modified properties.
  CategoryEntity copyWith(
    String? id,
    int? order,
    DateTime? createdAt,
    String? creatorId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
  ) =>
      CategoryEntity(
        id: id ?? this.id,
        order: order ?? this.order,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        title: title ?? this.title,
        colorCode: colorCode ?? this.colorCode,
        iconCode: iconCode ?? this.iconCode,
      );

  @override
  List<Object?> get props => [
        id,
        order,
        createdAt,
        creatorId,
        description,
        title,
        colorCode,
        iconCode,
      ];

  @override
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  CategoryEntity toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}
