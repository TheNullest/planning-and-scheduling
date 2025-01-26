import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamaan/core/common/cubits/user/app_user_cubit.dart';
import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/core/constants/app_texts.dart';
import 'package:zamaan/core/constants/routes.dart';
import 'package:zamaan/core/utils/navigator.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/params/user_signin_params.dart';
import 'package:zamaan/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:zamaan/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignUpUsecase signUpUsecase,
    required SignInUsecase signInUsecase,
    required CurrentUserUsecase currentUserUsecase,
    required SignOutUsecase signOutUsecase,
    required AppUserCubit appUserCubit,
  })  : _signUpUsecase = signUpUsecase,
        _signInUsecase = signInUsecase,
        _currentUserUsecase = currentUserUsecase,
        _signOutUsecase = signOutUsecase,
        _appUserCubit = appUserCubit,
        super(AuthInitialState()) {
    on<AuthEvent>(
      (event, emit) =>
          event is! AuthSignOutEvent ? emit(AuthLoadingState()) : null,
    );

    on<AuthIsUserSignedInEvent>(_isUserSignedIn);
    on<AuthSignUpEvent>(_onAuthSignUp);
    on<AuthSignInEvent>(_onAuthSignIn);
    on<AuthSignOutEvent>(_onAuthSignOut);

    _appUserCubit.stream.listen((state) {
      if (state is AppUserSignedOutState) {
        add(AuthSignOutEvent(state));
      }
    });
  }

  final SignUpUsecase _signUpUsecase;
  final SignInUsecase _signInUsecase;
  final CurrentUserUsecase _currentUserUsecase;
  final SignOutUsecase _signOutUsecase;
  final AppUserCubit _appUserCubit;

  FutureVoid _isUserSignedIn(
    AuthIsUserSignedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _currentUserUsecase();
    result.fold(
      (failure) => emit(AuthFailureState(message: failure.toString())),
      (user) => _emitAuthSuccess(
        user: user,
        emit: emit,
      ),
    );
    return;
  }

  FutureVoid _onAuthSignUp(
    AuthSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (event.confirmPassword.compareTo(event.user.password) != 0) {
      emit(
        AuthFailureState(
          message: AppTexts.errors.passwordMismatch,
        ),
      );
    }
    final response = await _signUpUsecase(event.user);
    response.fold(
      (failure) => emit(AuthFailureState(message: failure.message)),
      (user) => _emitAuthSuccess(user: user, emit: emit),
    );
    return;
  }

  FutureVoid _onAuthSignIn(
    AuthSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _signInUsecase(event.params);
    response.fold(
      (failure) => emit(AuthFailureState(message: failure.toString())),
      (user) => _emitAuthSuccess(user: user, emit: emit),
    );
    return;
  }

  FutureVoid _onAuthSignOut(
    AuthSignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _signOutUsecase();
    response.fold((failure) => emit(AuthFailureState(message: failure.message)),
        (_) {
      emit(AuthUserSignedOutState());
      navigatorPushRemoveUntil(event.state.context, Routes.signInStringRoute);
    });
    return;
  }

  void _emitAuthSuccess({
    required UserEntity user,
    required Emitter<AuthState> emit,
  }) {
    log(user.toString());
    _appUserCubit.updateUser(user);

    emit(AuthSuccessState(user));
  }
}
