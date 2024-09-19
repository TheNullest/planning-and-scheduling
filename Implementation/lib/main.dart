import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/features/auth/data/data_sources/hive_authentication_data_source_impl.dart';
import 'package:zamaan/features/auth/data/repositories/hive/hive_authentication_repository_impl.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/usecases/delete_all_selected_users_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/delete_user_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/get_users_usecase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for Windows
  await HiveInitializer.init();
  final dataSource = HiveAuthenticationDataSourceImpl();

  await DeleteUserUseCase(HiveAuthenticationRepositoryImpl(dataSource))('1');

  // for (int i = 0; i < 10; i++) {
  //   await CreateUserUseCase(HiveAuthenticationRepositoryImpl(dataSource))(
  //       UserEntity.empty());
  // }

  final getusers =
      GetUsersUsecase(HiveAuthenticationRepositoryImpl(dataSource));

  var users = await getusers();

  users.fold((Failure Failure) {}, (entities) async {
    int i = 1;
    for (UserEntity user in entities) {
      log('${i++} User: ${user.id}');
    }
    await DeleteAllSelectedUsersUsecase(
            HiveAuthenticationRepositoryImpl(dataSource))(
        entities.map((entity) => entity.id).toList());
  });
  runApp(const Zamaan());
}

class Zamaan extends StatelessWidget {
  const Zamaan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



//TODO #2 Implement a versioning system within your models (e.g., an additional field) to track changes over time. 
//This allows you to differentiate between data stored under different model versions.

// Ask about git versioning from Gemini

