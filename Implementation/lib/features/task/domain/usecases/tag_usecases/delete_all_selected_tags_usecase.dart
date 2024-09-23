import 'package:zamaan/core/usecases/delete_entities_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/tag_repository.dart';

class DeleteAllSelectedTagsUsecase
    extends DeleteEntitiesUseCase<TagRepository> {
  DeleteAllSelectedTagsUsecase(super.repository);
}
