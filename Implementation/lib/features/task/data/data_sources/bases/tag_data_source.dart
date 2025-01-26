import 'package:zamaan/core/data_sources/base_data_source_abstraction.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';

abstract class TagDataSource<TagModel extends TagEntity>
    extends BaseDataSourceAbstraction<TagModel> {}
