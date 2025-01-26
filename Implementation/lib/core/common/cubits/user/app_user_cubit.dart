import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamaan/core/common/entities/user_entity.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitialState());

  void updateUser(UserEntity? user) => user == null
      ? emit(AppUserInitialState())
      : emit(AppUserSignedInState(user: user));

  void signOutUser(BuildContext context) =>
      emit(AppUserSignedOutState(context: context));
}
