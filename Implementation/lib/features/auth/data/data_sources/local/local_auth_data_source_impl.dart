import 'package:dartz/dartz.dart';
import 'package:zamaan/core/constants/app_texts.dart';
import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/data_sources/local/local_auth_data_source.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';

class LocalAuthDataSourceImpl extends LocalAuthDataSource {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveUserModel> hiveBox] like this
  LocalAuthDataSourceImpl({
    HiveServices<LocalUserModel>? hiveBox,
  }) : _hiveBox = hiveBox ?? HiveServices<LocalUserModel>();
  final String _boxName = HiveBoxConstants.USERS_BOX;
  final HiveServices<LocalUserModel> _hiveBox;

  @override
  ResultFuture<LocalUserModel> getCurrentUser() async =>
      tryCatchEither<LocalUserModel>(
        action: () async => _hiveBox.operator<LocalUserModel>(
          job: (box) async => box.values.first,
          boxName: _boxName,
        ),
        failureType: FailureType.local,
      );

  @override
  ResultFutureVoid storeCurrentUser(LocalUserModel user) async =>
      tryCatchEither(
        action: () async {
          await _hiveBox.operator(
            job: (box) async {
              final existing =
                  box.values.where((user) => user.userName == user.userName);
              if (existing.isNotEmpty) {
                throw Exception(
                  user.userName + AppTexts.errors.entityExistsInDatabase,
                );
              }
              await box.add(user);
            },
            boxName: _boxName,
          );
          return const Right(null);
        },
        failureType: FailureType.local,
      );

  @override
  ResultFutureVoid signOut() async => tryCatchEither(
        action: () async {
          await _hiveBox.operator(
            job: (box) async => box.clear(),
            boxName: _boxName,
          );
          return const Right(null);
        },
        failureType: FailureType.local,
      );
}
