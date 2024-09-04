import 'package:zamaan/models/selected_week_days_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class SelectedWeekDaysDTO extends DTOAbstraction<SelectedWeekDaysModel> {
  final List<int> selectedWeekDays;
  final String mainTaskId;
  SelectedWeekDaysDTO({
    required super.id,
    required this.mainTaskId,
    super.description,
    required this.selectedWeekDays,
  });

  factory SelectedWeekDaysDTO.fromModel(
          {required SelectedWeekDaysModel selectedWeekDaysModel}) =>
      SelectedWeekDaysDTO(
          id: selectedWeekDaysModel.id,
          mainTaskId: selectedWeekDaysModel.mainTaskId,
          description: selectedWeekDaysModel.description,
          selectedWeekDays: selectedWeekDaysModel.selectedWeekDays);

  @override
  SelectedWeekDaysModel toModel() => SelectedWeekDaysModel(
        id: id,
        mainTaskId: mainTaskId,
        selectedWeekDays: selectedWeekDays,
        description: description,
      );
}
