import 'package:hive/hive.dart';
import 'package:zamaan/data/models/main_task_model.dart';
import 'package:zamaan/data/repositories/hive_base_repository_abstraction.dart';

class MainTaskRepo
    extends HiveBaseRepositoryAbstraction<MainTaskModel, String> {
  static const String _boxName = 'mainTasksBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<MainTaskModel> get modelAdapter => MainTaskModelAdapter();

  @override
  Future<void> getBySpecificValue(
      {required void Function(MainTaskModel?) callback,
      required String value}) async {
    await initializeBox(boxName: boxName);
    final List<MainTaskModel> tasks = await getAll();
    callback(tasks.where((task) => task.title == value).firstOrNull);
  }
}
