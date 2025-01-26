// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class AppTexts {
  const AppTexts._(); // Prevents unintended initialization
  static final uiTexts = _UiTexts();
  static final widgetTexts = _WidgetTexts();
  static final hints = _Hints();
  static final errors = _Errors();
}

class _UiTexts {
  final String signUp = 'Sign Up.';
  final String signIn = 'Sign In.';
  final String dontHaveAccount = "Don't have an account? ";
  final String haveAccount = 'Already have an account? ';
}

class _WidgetTexts {
  final String signUp = 'Sign Up';
  final String signIn = 'Sign In';
}

class _Hints {
  final String email = 'Email';
  final String userName = 'User Name';
  final String firstName = 'First Name';
  final String lastName = 'Last Name';
  final String password = 'Password';
  final String confirmPassword = 'Confirm Password';
}

class _Errors {
  final String noInternetConnection = 'No internet connection!';
  final String userNotSignedIn = 'User not logged in!';
  final String cannotDeleteUnauthenticatedUser =
      'User is not authenticated. Cannot delete account.';
  final String entityExistsInDatabase = ' exists in the database!';
  final String passwordMismatch =
      'The password and the confirm password are not the same!';
}
