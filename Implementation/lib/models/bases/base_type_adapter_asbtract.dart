import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_model_abstract.dart';

abstract class BaseTypeAdapterAbstract<Model extends BaseModelAbstraction>
    extends TypeAdapter<Model> {
  void registerAdapter() {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter<Model>(this);
    }
  }
}
