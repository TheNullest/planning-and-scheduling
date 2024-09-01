import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/repositories/hive_base_repository_abstraction.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

abstract class BaseViewModel<
        DTO extends DTOAbstract,
        Model extends BaseModelAbstract,
        HiveModelRepo extends HiveBaseRepositoryAbstraction<Model>>
    extends ChangeNotifier {
  BaseViewModel({required this.repository}) {
    _initialize();
  }

  void _initialize() =>
      Future.delayed(Duration.zero, () async => await loadEntities());

  //TODO #7 Add and implement error and exception handling
  HiveModelRepo repository;

  late List<DTO>? _entities = [];
  List<DTO>? get entities => _entities;

  late List<DTO> _filteredEntities = [];
  List<DTO> get filteredEntities => _filteredEntities;
  set filteredEntities(value) => _filteredEntities = value;

  late bool _isLoading = false;

  /// To implement wait mode in fetching data when opening the app and initial display as well as when searching
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Fetch relevant and desired data from the database
  Future<List<DTO>?> loadEntities() async {
    try {
      isLoading = true;
      _entities = await repository.getAll();
      log("Loading entities");
    } catch (e) {
      // Handle error
      log("Error loading entities: $e");
    } finally {
      isLoading = false;
    }
    return entities;
  }

  DTO? getById({required String id}) {
    try {
      return _entities!.firstWhere((entity) => entity.id == id);
    } on Exception catch (e) {
      if (e is StateError) {
        // Handle the case where no matching element is found
        return null;
      } else {
        // Re-throw if it's not the expected error
        rethrow;
      }
    }
  }

  DTO? getByKey({required dynamic key}) {
    try {
      return _entities!.firstWhere((entity) => entity.key == key);
    } on Exception catch (e) {
      if (e is StateError) {
        // Handle the case where no matching element is found
        return null;
      } else {
        // Re-throw if it's not the expected error
        rethrow;
      }
    }
  }

  Future<bool> addEntity({
    required DTO newEntity,
  }) async {
    isLoading = true;
    search(query: newEntity);
    if (filteredEntities.isNotEmpty) {
      log(filteredEntities[0].id);
      filteredEntities.clear();
      return false;
    }
    //TODO Implement appropriate message display
    await repository.save(item: newEntity);
    await loadEntities();
    return true;
  }

  Future<void> updateEntity(Model updateEntity) async {
    isLoading = true;
    await repository.update(item: updateEntity);
    //TODO Implement appropriate message display
    isLoading = false;
  }

  Future<void> deleteEntity(Model deleteEntity) async {
    isLoading = true;
    await repository.delete(item: deleteEntity);
    //TODO Implement appropriate message display
    isLoading = false;
  }

  void search({required DTO query});

  void sort({required int Function(DTO a, DTO b) compareFunction}) {
    isLoading = true;
    entities!.sort(compareFunction);
    isLoading = false;
  }
}
