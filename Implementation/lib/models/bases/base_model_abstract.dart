import 'package:hive/hive.dart';

abstract class BaseModelAbstraction extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(24)
  final String? creatorId;

  @HiveField(25)
  final String? description;

  BaseModelAbstraction({required this.id, this.creatorId, this.description});
}
