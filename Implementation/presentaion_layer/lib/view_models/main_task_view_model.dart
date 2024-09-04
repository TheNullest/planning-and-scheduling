import 'package:zamaan/models/main_task_model.dart';
import 'package:zamaan/repositories/hive_main_task_repo.dart';
import 'package:zamaan/view_models/base_view_model.dart';
import 'package:zamaan/view_models/dtos/dtos.dart';

class MainTaskViewModel
    extends BaseViewModel<MainTaskDTO, MainTaskModel, HiveMainTaskRepo> {
  MainTaskViewModel({required super.repository});

  @override
  void search({required MainTaskDTO query}) {
    isLoading = true;
    filteredEntities = entities!
        .where((entity) =>
            entity.title.toLowerCase().contains(query.title.toLowerCase()))
        .toList();
    isLoading = false;
  }

  void getCompletedTasks() {
    isLoading = true;
    filteredEntities = entities!.where((task) => task.completed).toList();
    isLoading = false;
  }

  @override
  modelToDTOConverter({required model}) =>
      MainTaskDTO.fromModel(mainTaskModel: model);
}
