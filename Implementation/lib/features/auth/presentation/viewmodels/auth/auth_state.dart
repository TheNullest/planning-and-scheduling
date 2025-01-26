part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  const AuthSuccessState(this.user);

  final UserEntity user;
  @override
  List<Object> get props => [user];
}

final class AuthFailureState extends AuthState {
  const AuthFailureState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class AuthUserSignedOutState extends AuthState {}
