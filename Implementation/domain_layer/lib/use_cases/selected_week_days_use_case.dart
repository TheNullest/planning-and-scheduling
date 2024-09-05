import 'package:data_layer/models/models.dart';
import 'package:domain_layer/dtos/dtos.dart';
import 'package:data_layer/repositories/hive_seleceted_week_days_repo.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class SelectedWeekDaysUseCase extends UseCaseAbstraction<SelectedWeekDaysModel,
    HiveSelectedWeekDaysRepo, SelectedWeekDaysDTO> {
  @override
  SelectedWeekDaysDTO fromModel(SelectedWeekDaysModel model) =>
      SelectedWeekDaysDTO.fromModel(model: model);
}
