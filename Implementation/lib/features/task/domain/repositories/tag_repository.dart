import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';

abstract class TagRepository extends BaseRepositoryAbstraction<TagEntity> {
  ResultFuture<List<TagEntity>> getTagsByCreatorId(List<String> creatorIds);
}
