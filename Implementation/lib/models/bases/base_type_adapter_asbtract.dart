import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_model_abstract.dart';

abstract class BaseTypeAdapterAbstract<T extends TypeAdapter<Model>,
    Model extends BaseModelAbstract> extends TypeAdapter<Model> {
  void registerAdapter() {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter<Model>(this);
    }
  }
}
