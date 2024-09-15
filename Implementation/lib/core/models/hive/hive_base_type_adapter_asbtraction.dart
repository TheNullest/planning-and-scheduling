import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';

abstract class HiveBaseTypeAdapterAbstraction<
    Model extends BaseEntityAbstraction> extends TypeAdapter<Model> {
  void registerAdapter() {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter<Model>(this);
    }
  }
}
