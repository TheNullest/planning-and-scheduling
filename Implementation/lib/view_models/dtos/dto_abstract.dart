import 'package:zamaan/models/bases/base_model_abstract.dart';

abstract class DTOAbstract<T extends BaseModelAbstract> {
  final String id;

  DTOAbstract({required this.id});

  /// For when want to store the desired DTO in the DB,\
  /// must convert adn adapt it into a data model
  T toModel();
}
