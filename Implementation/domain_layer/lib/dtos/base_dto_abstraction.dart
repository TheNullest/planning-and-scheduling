import 'package:data_layer/models/bases/base_model_abstraction.dart';

abstract class BaseDTOAbstraction<T extends BaseModelAbstraction> {
  final String id;
  final String? creatorId;
  final String? description;
  BaseDTOAbstraction({required this.id, this.creatorId, this.description});

  factory BaseDTOAbstraction.fromModel({required T model}) {
    // This is just a placeholder. The actual implementation will be in the subclass.
    throw UnimplementedError('This should be implemented in the subclass');
  }

  /// Converts the DTO to a model for storage in the database.
  T toModel();
}
