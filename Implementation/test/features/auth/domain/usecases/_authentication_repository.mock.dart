import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/authentication_repository.dart';

export 'package:dartz/dartz.dart' hide Evaluation;
export 'package:flutter_test/flutter_test.dart';
export 'package:mocktail/mocktail.dart';
export 'package:zamaan/core/common/entities/user_entity.dart';
export 'package:zamaan/features/auth/domain/repositories/authentication_repository.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

// By adding this setup, can be ensure that mocktail knows how to handle UserEntity when using any or captureAny in our tests
class FakeUserEntity extends Fake implements UserEntity {}
