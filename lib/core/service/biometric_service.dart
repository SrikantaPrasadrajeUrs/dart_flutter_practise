import 'package:local_auth/local_auth.dart';

class BiometricService {
  final _auth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    final canCheck = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();
    return isDeviceSupported && canCheck;
  }

  Future<bool> authenticate()async{
    if(await isBiometricAvailable()){
      return await _auth.authenticate(
          options: AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true
          ),
          localizedReason: "Please authenticate to continue"
      );
    }
    return false;
  }
}
