import 'package:zamaan/models/bases/base_model_abstract.dart';

abstract class DTOAbstraction<T extends BaseModelAbstraction> {
  final String id;
  final String? creatorId;
  final String? description;
  DTOAbstraction({required this.id, this.creatorId, this.description});

  /// For when want to store the desired DTO in the DB,\
  /// must convert adn adapt it into a data model
  T toModel();
}
