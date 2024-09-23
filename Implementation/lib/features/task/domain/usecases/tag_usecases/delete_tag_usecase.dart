import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/tag_repository.dart';

class DeleteTagUsecase extends DeleteEntityUseCase<TagRepository> {
  DeleteTagUsecase(super.repository);
}
