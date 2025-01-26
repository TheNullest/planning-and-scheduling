import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/errors/exceptions/failure.dart';
import 'package:zamaan/core/errors/exceptions/local_exception.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/features/auth/data/data_sources/local/local_auth_data_source_impl.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';

class MockHiveServices extends Mock implements HiveServices<LocalUserModel> {}

void main() {
  late LocalAuthDataSourceImpl dataSource;
  late MockHiveServices mockHiveServices;
  late LocalUserModel testUser;

  setUp(() {
    mockHiveServices = MockHiveServices();
    dataSource = LocalAuthDataSourceImpl(hiveBox: mockHiveServices);
    testUser = LocalUserModel.empty();
  });

  group('LocalAuthDataSourceImpl', () {
    test('getCurrentUser returns user on success', () async {
      when(
        () => mockHiveServices.operator<Either<Failure, LocalUserModel>>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).thenAnswer((_) async => Right(testUser));

      final result = await dataSource.getCurrentUser();

      expect(result, equals(testUser));
      verify(
        () => mockHiveServices.operator<LocalUserModel>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).called(1);
    });

    test('getCurrentUser throws exception on failure', () async {
      when(
        () => mockHiveServices.operator<Either<Failure, LocalUserModel>>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).thenAnswer((_) async => Left(LocalException(message: 'Error')));

      expect(() => dataSource.getCurrentUser(), throwsA(isA<LocalException>()));
      verify(
        () => mockHiveServices.operator<Either<Failure, LocalUserModel>>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).called(1);
    });

    test('storeCurrentUser stores user on success', () async {
      when(
        () => mockHiveServices.operator<void>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.storeCurrentUser(testUser);

      expect(result, equals(Future.value()));
      verify(
        () => mockHiveServices.operator<void>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).called(1);
    });

    test('storeCurrentUser throws exception if user exists', () async {
      when(
        () => mockHiveServices.operator<void>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).thenThrow(Exception('testUser already exists in database'));

      expect(
        () => dataSource.storeCurrentUser(testUser),
        throwsA(isA<Exception>()),
      );
      verify(
        () => mockHiveServices.operator<void>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).called(1);
    });

    test('signOut clears user data on success', () async {
      when(
        () => mockHiveServices.operator<void>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.signOut();

      expect(result, equals(const Right(null)));
      verify(
        () => mockHiveServices.operator<void>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).called(1);
    });

    test('signOut throws exception on failure', () async {
      when(
        () => mockHiveServices.operator<void>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).thenAnswer((_) async => Left(LocalException(message: 'Error')));

      expect(() => dataSource.signOut(), throwsA(isA<LocalException>()));
      verify(
        () => mockHiveServices.operator<void>(
          job: any(named: 'job'),
          boxName: HiveBoxConstants.USERS_BOX,
        ),
      ).called(1);
    });
  });
}
