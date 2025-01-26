part of 'app_user_cubit.dart';

sealed class AppUserState extends Equatable {
  const AppUserState();

  @override
  List<Object> get props => [];
}

final class AppUserInitialState extends AppUserState {}

final class AppUserSignedInState extends AppUserState {
  const AppUserSignedInState({required this.user});

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

final class AppUserSignedOutState extends AppUserState {
  const AppUserSignedOutState({required this.context});

  final BuildContext context;

  @override
  List<Object> get props => [context];
}
