import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';
import 'package:zamaan/features/task/domain/repositories/tag_repository.dart';

class GetTagsUsecase extends getEntitiesUseCase<TagRepository, TagEntity> {
  GetTagsUsecase(super.repository);
}
