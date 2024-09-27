import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_tag_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_tag_model.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';
import 'package:zamaan/features/task/domain/repositories/tag_repository.dart';

class TagRepositoryImpl
    extends BaseCRUDOperations<TagEntity, HiveTagModel, HiveTagDataSourceImpl>
    implements TagRepository {
  TagRepositoryImpl(super.dataSource);

  @override
  HiveTagModel fromEntity(TagEntity entity) => HiveTagModel.fromEntity(entity);

  @override
  TagEntity toEntity(HiveTagModel model) => model.toEntity();
}
