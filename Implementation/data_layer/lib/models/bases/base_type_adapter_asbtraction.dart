import 'package:hive/hive.dart';
import 'base_model_abstraction.dart';

abstract class BaseTypeAdapterAbstraction<Model extends BaseModelAbstraction>
    extends TypeAdapter<Model> {
  void registerAdapter() {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter<Model>(this);
    }
  }
}
