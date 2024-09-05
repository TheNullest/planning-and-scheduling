import 'package:data_layer/models/bases/base_model_abstraction.dart';
import 'package:data_layer/repositories/hive_base_repository_abstraction.dart';
import 'package:domain_layer/dtos/base_dto_abstraction.dart';

abstract class UseCaseAbstraction<
    Model extends BaseModelAbstraction,
    Repo extends HiveBaseRepositoryAbstraction<Model>,
    DTO extends BaseDTOAbstraction<Model>> {
  late Repo _repository;
  set repository(Repo value) => _repository = value;

  DTO fromModel(Model model);

  //TODO Make the necessary predictions for exceptions
  Future<List<DTO>> getEntities() async {
    final models = await _repository.getAll();
    return models.map((model) => fromModel(model)).toList();
  }

  //TODO Make the necessary predictions for exceptions
  Future<bool> addNewEntity({required DTO item}) async =>
      _repository.save(item: item.toModel());

  //TODO Make the necessary predictions for exceptions
  Future<void> updateEntity({required DTO item}) async =>
      await _repository.update(item: item.toModel());

  //TODO Make the necessary predictions for exceptions
  Future<void> deleteEntity({required dynamic key}) async =>
      await _repository.delete(id: key);
}
