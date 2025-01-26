import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zamaan/core/network/connection_checker.dart';
import 'package:zamaan/features/auth/data/data_sources/remote/remote_auth_data_source_impl.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';

import '../../../domain/usecases/_authentication_repository.mock.dart';

class MockConnectionChecker extends Mock implements ConnectionChecker {}

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

void main() {
  late RemoteAuthDataSourceImpl dataSource;
  late MockConnectionChecker mockConnectionChecker;
  late MockSupabaseClient mockSupabaseClient;
  late MockGoTrueClient mockGoTrueClient;
  late Session mockCurrentUserSession;
  late User mockUser;
  late RemoteUserModel tRemoteUserModel;
  setUp(() {
    mockConnectionChecker = MockConnectionChecker();
    mockSupabaseClient = MockSupabaseClient();
    mockGoTrueClient = MockGoTrueClient();
    tRemoteUserModel = RemoteUserModel.empty();
    mockUser = User(
      id: tRemoteUserModel.id,
      email: tRemoteUserModel.emailAddress,
      userMetadata: tRemoteUserModel.toSupabaseDataMap(),
      appMetadata: {},
      aud: '',
      createdAt: tRemoteUserModel.createdAt.toIso8601String(),
    );
    mockCurrentUserSession =
        Session(accessToken: '', tokenType: '', user: mockUser);
    dataSource = RemoteAuthDataSourceImpl(
      connectionChecker: mockConnectionChecker,
      supabaseClient: mockSupabaseClient,
    );
  });

  group('getCurrentUser', () {
    test(
        '[remoteDataSource.getCurrentUser] should return RemoteUserModel when there is a current user session',
        () async {
      // arrange
      when(() => mockGoTrueClient.currentSession)
          .thenReturn(mockCurrentUserSession);
      when(() => mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
      when(
        () async => Right(
          RemoteUserModel.fromJson(
            await mockSupabaseClient
                .from('profiles')
                .select()
                .eq('id', mockCurrentUserSession.user.id)
                .single(),
          ).copyWith(emailAddress: mockCurrentUserSession.user.email),
        ),
      ).thenAnswer((_) async => Right(tRemoteUserModel));

      final result = await dataSource.getCurrentUser();

      expect(result.isRight(), true);
      expect(result, equals(Right(tRemoteUserModel)));
      verify(() => mockGoTrueClient.currentSession).called(1);
      verify(() => mockSupabaseClient.auth).called(1);
      verify(
        () => mockSupabaseClient
            .from('profiles')
            .select()
            .eq('id', mockCurrentUserSession.user.id)
            .single(),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
      verifyNoMoreInteractions(mockGoTrueClient);
      verifyNoMoreInteractions(mockSupabaseClient);
    });
  });
}
