import 'package:data_layer/models/goal_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';

class GoalDTO extends BaseDTOAbstraction<GoalModel> {
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

  factory GoalDTO.fromModel({required GoalModel model}) => GoalDTO(
        id: model.id,
        description: model.description,
        mainTaskId: model.mainTaskId,
        perDay: model.perDay,
        perWeek: model.perWeek,
        perMonth: model.perMonth,
        perYear: model.perYear,
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
