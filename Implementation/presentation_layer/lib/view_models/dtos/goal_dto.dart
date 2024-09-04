import 'package:zamaan/models/goal_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class GoalDTO extends DTOAbstraction<GoalModel> {
  final String mainTaskId;

  /// The minimum amount of time allocated in seconds for the desired task or program each day
  final int? perDay;

  /// The minimum amount of time allocated in seconds for the desired task or program each week
  final int? perWeek;

  /// The minimum amount of time allocated in seconds for the desired task or program each month
  final int? perMonth;

  /// The minimum amount of time allocated in seconds for the desired task or program each year
  final int? perYear;

  GoalDTO({
    required super.id,
    required this.mainTaskId,
    super.description,
    this.perDay,
    this.perWeek,
    this.perMonth,
    this.perYear,
  });

  factory GoalDTO.fromModel({required GoalModel goalModel}) => GoalDTO(
        id: goalModel.id,
        description: goalModel.description,
        mainTaskId: goalModel.mainTaskId,
        perDay: goalModel.perDay,
        perWeek: goalModel.perWeek,
        perMonth: goalModel.perMonth,
        perYear: goalModel.perYear,
      );

  @override
  GoalModel toModel() => GoalModel(
        id: id,
        mainTaskId: mainTaskId,
        description: description,
        perDay: perDay,
        perWeek: perWeek,
        perMonth: perMonth,
        perYear: perYear,
      );
}
