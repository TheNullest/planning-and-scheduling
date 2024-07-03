import 'package:local_auth/local_auth.dart';
import 'package:zamaan/data/models/user_model.dart';
import 'package:zamaan/data/repositories.dart';

class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();
  Future<bool> canCheckBiometrics() async => _auth.canCheckBiometrics;

  Future<bool> authenticateWithBiometrics() async {
    final availableBiometrics = await _auth.getAvailableBiometrics();
    if (availableBiometrics.isEmpty) return false;
    return await _auth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(stickyAuth: true));
  }

  Future<bool> loginWithUserPass(String userName, String password) async {
    final List<UserModel> users = await UsersRepo().getAll();
    for (UserModel user in users) {
      if (user.userName == userName) {
        if (user.password == password) {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }
}
