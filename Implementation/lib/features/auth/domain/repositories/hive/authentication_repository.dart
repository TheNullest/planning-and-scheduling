import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';

abstract class AuthenticationRepository
    extends BaseRepositoryAbstraction<UserEntity> {}
