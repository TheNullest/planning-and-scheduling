part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;
Future<void> intiDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveServices.init();

  _initAuth();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );

  serviceLocator
    ..registerLazySingleton(() => supabase.client)

    // core

    ..registerLazySingleton(AppUserCubit.new)
    ..registerFactory(InternetConnection.new)
    ..registerFactory<ConnectionChecker>(
      () => ConnectionCheckerImpl(serviceLocator()),
    );
}

void _initAuth() {
  serviceLocator

    // Initilizers
    ..registerFactory(HiveServices<LocalUserModel>.new)

    // DataSources
    ..registerFactory<LocalAuthDataSource>(
      () => LocalAuthDataSourceImpl(
        hiveBox: serviceLocator(),
      ),
    )
    ..registerFactory<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(
        connectionChecker: serviceLocator(),
        supabaseClient: serviceLocator(),
      ),
    )

    // Repository
    ..registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        remoteDataSource: serviceLocator(),
        localDataSource: serviceLocator(),
        connectionChecker: serviceLocator(),
      ),
    )

    // Usecases
    ..registerFactory(() => CurrentUserUsecase(serviceLocator()))
    ..registerFactory(() => SignUpUsecase(serviceLocator()))
    ..registerFactory(() => SignInUsecase(serviceLocator()))
    ..registerFactory(() => SignOutUsecase(serviceLocator()))

    // AuthBloc
    ..registerLazySingleton(
      () => AuthBloc(
        signUpUsecase: serviceLocator(),
        signInUsecase: serviceLocator(),
        currentUserUsecase: serviceLocator(),
        signOutUsecase: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
