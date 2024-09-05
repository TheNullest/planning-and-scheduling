import 'package:data_layer/models/selected_week_days_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';

class SelectedWeekDaysDTO extends BaseDTOAbstraction<SelectedWeekDaysModel> {
  final List<int> selectedWeekDays;
  final String mainTaskId;
  SelectedWeekDaysDTO({
    required super.id,
    required this.mainTaskId,
    super.description,
    required this.selectedWeekDays,
  });

  factory SelectedWeekDaysDTO.fromModel(
          {required SelectedWeekDaysModel model}) =>
      SelectedWeekDaysDTO(
          id: model.id,
          mainTaskId: model.mainTaskId,
          description: model.description,
          selectedWeekDays: model.selectedWeekDays);

  @override
  SelectedWeekDaysModel toModel() => SelectedWeekDaysModel(
        id: id,
        mainTaskId: mainTaskId,
        selectedWeekDays: selectedWeekDays,
        description: description,
      );
}
