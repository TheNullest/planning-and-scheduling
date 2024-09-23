import 'package:zamaan/core/usecases/create_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';
import 'package:zamaan/features/task/domain/repositories/tag_repository.dart';

class CreateTagUsecase extends CreateEntityUseCase<TagRepository, TagEntity> {
  CreateTagUsecase(super.repository);
}
