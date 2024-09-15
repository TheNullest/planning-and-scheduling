import 'package:flutter/material.dart';
import 'package:zamaan/features/auth/data/data_sources/hive_authentication_data_source_iml.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/data/repositories/hive/hive_authentication_repository_impl.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/delete_user_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/get_users_usecase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for Windows

  final dataSource = HiveAuthenticationDataSourceImpl();

  await CreateUserUseCase(HiveAuthenticationRepositoryImpl(
          dataSource: dataSource, hiveModelHelper: HiveUserModel.empty()))
      .call(UserEntity(
          password: "vS3xHUyGPMWt1iO",
          id: "1",
          userName: "Jaycee49",
          firstName: "Marvin",
          birthDate: DateTime.now(),
          lastName: "Ritchie",
          emailAddress: "Shaylee.Harber69@yahoo.com",
          createdAt: DateTime.now(),
          description:
              "The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design",
          avatarPath:
              "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1041.jpg"));
  await CreateUserUseCase(HiveAuthenticationRepositoryImpl(
          dataSource: dataSource, hiveModelHelper: HiveUserModel.empty()))
      .call(UserEntity(
          password: "vS3xHUyGPMWt1iO",
          id: "2",
          userName: "moien",
          firstName: "janlou",
          birthDate: DateTime.now(),
          lastName: "Ritchie",
          emailAddress: "Shaylee.Harber69@fffff.com",
          createdAt: DateTime.now(),
          description:
              "The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design",
          avatarPath:
              "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1041.jpg"));

  final deleteuser = DeleteUserUseCase(HiveAuthenticationRepositoryImpl(
      dataSource: dataSource, hiveModelHelper: HiveUserModel.empty()));

  final getusers = GetUsersUsecase(HiveAuthenticationRepositoryImpl(
      dataSource: dataSource, hiveModelHelper: HiveUserModel.empty()));

  await getusers.call().then((either) {
    either.fold((failure) {
      // Handle failure (e.g., show an error message)
      print('Failure: $failure');
    }, (users) {
      // Handle successful result (e.g., update UI with user data)
      print('Users: ${users.length}');
    });
  }).catchError((error) {
    // Handle unexpected errors
    print('Error: $error');
  });
  await deleteuser.call('2');

  await getusers.call().then((either) {
    either.fold((failure) {
      // Handle failure (e.g., show an error message)
      print('Failure: $failure');
    }, (users) {
      // Handle successful result (e.g., update UI with user data)
      print('Users: ${users.length}');
    });
  }).catchError((error) {
    // Handle unexpected errors
    print('Error: $error');
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

