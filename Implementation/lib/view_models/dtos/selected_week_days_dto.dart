import 'package:zamaan/models/selected_week_days_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class SelectedWeekDaysDTO extends DTOAbstract {
  final List<int> selectedWeekDays;

  SelectedWeekDaysDTO({
    required super.id,
    required this.selectedWeekDays,
  });

  factory SelectedWeekDaysDTO.fromModel(
          {required SelectedWeekDaysModel selectedWeekDaysModel}) =>
      SelectedWeekDaysDTO(
          id: selectedWeekDaysModel.id,
          selectedWeekDays: selectedWeekDaysModel.selectedWeekDays);
}
