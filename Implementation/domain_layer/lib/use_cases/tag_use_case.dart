import 'package:data_layer/models/tag_model.dart';
import 'package:data_layer/repositories/hive_tag_repo.dart';
import 'package:domain_layer/dtos/tag_dto.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class TagUseCase extends UseCaseAbstraction<TagModel, HiveTagRepo, TagDTO> {
  @override
  TagDTO fromModel(TagModel model) => TagDTO.fromModel(model: model);
}
