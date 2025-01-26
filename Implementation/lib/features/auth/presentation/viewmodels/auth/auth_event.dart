part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthIsUserSignedInEvent extends AuthEvent {}

final class AuthSignUpEvent extends AuthEvent {
  const AuthSignUpEvent({required this.user, required this.confirmPassword});

  final UserEntity user;
  final String confirmPassword;

  @override
  List<Object> get props => [user, confirmPassword];
}

final class AuthSignInEvent extends AuthEvent {
  const AuthSignInEvent({required this.params});

  final UserSignInParams params;
  @override
  List<Object> get props => [params];
}

final class AuthSignOutEvent extends AuthEvent {
  const AuthSignOutEvent(this.state);

  final AppUserSignedOutState state;

  @override
  List<Object> get props => [state];
}
