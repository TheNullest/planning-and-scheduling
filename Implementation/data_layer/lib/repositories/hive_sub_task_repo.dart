import 'package:data_layer/models/models.dart';
import 'package:data_layer/repositories/hive_base_repository_abstraction.dart';
import 'package:hive/hive.dart';

class HiveSubTaskRepo extends HiveBaseRepositoryAbstraction<SubTaskModel> {
  static const String _boxName = 'subTasksBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<SubTaskModel> get modelAdapter => SubTaskModelAdapter();
}
