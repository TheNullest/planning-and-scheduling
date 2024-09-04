import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:zamaan/models/user_model.dart';
import 'package:zamaan/repositories/hive_repositories.dart';
import 'package:zamaan/utilities/routes/views_route.dart';
import 'package:zamaan/utilities/constants/toast_dialog_constants.dart';

class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();
  Future<bool> canCheckBiometrics() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  Future<void> authenticateWithBiometrics(
      {required BuildContext context}) async {
    final availableBiometrics = await _auth.getAvailableBiometrics();
    log(availableBiometrics.toString());
    if (availableBiometrics.isEmpty) return;
    final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: true));

    if (didAuthenticate && context.mounted) {
      ViewsRoute.goToSelectedView(context, view: 'main');
    }
  }

  Future<void> loginWithUserPass({
    required BuildContext context,
    required String userName,
    required String password,
  }) async {
    final List<UserModel> users = await HiveUsersRepo().getAll();
    UserModel? user =
        users.where((user) => user.userName == userName).firstOrNull;
    if (context.mounted) {
      if (user == null || user.password != password) {
        ToastDialogConstants.loginFailed(context);
      } else {
        ToastDialogConstants.loginSuccessfully(context);
        ViewsRoute.goToSelectedView(context, view: 'main');
      }
    }
  }
}
