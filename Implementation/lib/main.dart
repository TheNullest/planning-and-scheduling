import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/data_sources/local/hive_authentication_data_source_impl.dart';
import 'package:zamaan/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/delete_all_selected_users_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/delete_user_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/get_users_usecase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for Windows
  await HiveInitializer.init();
  final dataSource = AuthenticationDataSourceImpl();

  await DeleteUserUseCase(AuthenticationRepositoryImpl(dataSource))('1');

  Result<UserEntity> user =
      await GetUserUsecase(AuthenticationRepositoryImpl(dataSource))
          .call('30ef8c2b-ec62-4151-9a54-055d0b7a967');

  user.fold((Failure failure) => log(failure.message),
      (user) => log(user.toString()));

  // for (int i = 0; i < 10; i++) {
  //   await CreateUserUseCase(AuthenticationRepositoryImpl(dataSource))(
  //       UserEntity.empty());
  // }

  // final getusers = GetUsersUsecase(AuthenticationRepositoryImpl(dataSource));

  // var users = await getusers();

  // users.fold(
  //   (Failure Failure) {},
  //   (entities) async {
  //     int i = 1;
  //     for (UserEntity user in entities) {
  //       log(user.toString());
  //     }
  //     // await DeleteAllSelectedUsersUsecase(
  //     //         AuthenticationRepositoryImpl(dataSource))(
  //     //     entities.map((entity) => entity.id).toList());
  //   },
  // );
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

