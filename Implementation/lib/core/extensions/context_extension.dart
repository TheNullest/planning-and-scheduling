import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/core/common/providers/user_provider.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get mediaQueryWidth => size.width;
  double get mediaQueryHeight => size.height;

  //TODO Implement currentUser as extension for context

  UserProvider get userProvider => read<UserProvider>();
  LocalUserModel? get currentUser => userProvider.user;
}
