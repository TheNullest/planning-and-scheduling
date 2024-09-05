import 'package:data_layer/models/tag_model.dart';
import 'package:data_layer/repositories/hive_base_repository_abstraction.dart';
import 'package:hive/hive.dart';

class HiveTagRepo extends HiveBaseRepositoryAbstraction<TagModel> {
  static const String _boxName = 'groupsBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<TagModel> get modelAdapter => TagModelAdapter();
}
