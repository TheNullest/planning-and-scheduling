import 'package:hive/hive.dart';

abstract class BaseModelAbstract extends HiveObject {
  @HiveField(0)
  final String id;

  BaseModelAbstract({required this.id});
}
