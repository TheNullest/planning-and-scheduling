import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';

abstract class HiveBaseTypeAdapter<HiveModel extends BaseEntityAbstraction>
    extends TypeAdapter<HiveModel> {
  void registerAdapter() {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter<HiveModel>(this);
    }
  }
}
