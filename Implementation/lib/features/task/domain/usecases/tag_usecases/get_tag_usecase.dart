import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';
import 'package:zamaan/features/task/domain/repositories/tag_repository.dart';

class GetTagUsecase extends GetEntityUseCase<TagRepository, TagEntity> {
  GetTagUsecase(super.repository);
}
