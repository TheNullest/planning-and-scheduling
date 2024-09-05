import 'package:hive/hive.dart';
import '../models/main_task_model.dart';
import 'hive_base_repository_abstraction.dart';

class HiveMainTaskRepo extends HiveBaseRepositoryAbstraction<MainTaskModel> {
  static const String _boxName = 'mainTasksBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<MainTaskModel> get modelAdapter => MainTaskModelAdapter();
}
