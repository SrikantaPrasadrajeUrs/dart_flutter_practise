
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/core/service/auth_service.dart';
import 'package:first_project/models/user_model.dart';

class AuthRepo{
  final AuthService _authService;

  AuthRepo({required AuthService authService}):_authService=authService;

  Future<void> register({required String email, required String password})async{
    return await _authService.createUser(email, password);
  }

  Future<UserModel?> login({required String email, required String password})async{
    final userData = await _authService.signIn(email, password);
    if(userData!=null){
      final UserModel userModel = UserModel(uid: userData.user?.uid??"", isBiometricEnabled: false);
      return userModel;
    }
    return null;
  }
}