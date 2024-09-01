import 'package:zamaan/models/main_task_model.dart';
import 'package:zamaan/repositories/hive_main_task_repo.dart';
import 'package:zamaan/view_models/base_view_model.dart';

class MainTaskViewModel extends BaseViewModel<MainTaskModel, HiveMainTaskRepo> {
  MainTaskViewModel({required super.repository});

  @override
  void search({required MainTaskModel query}) {
    isLoading = true;
    filteredEntities = entities!
        .where((entity) =>
            entity.title.toLowerCase().contains(query.title.toLowerCase()))
        .toList();
    isLoading = false;
  }

  List<MainTaskModel> getCompletedTasks() {
    isLoading = true;
    filteredEntities = entities!.where((task) => task.completed).toList();
    isLoading = false;
    return filteredEntities;
  }
}
