
import 'package:first_project/core/service/auth_service.dart';

class AuthRepo{
  final AuthService _authService = AuthService();

  Future<void> register({required String email, required String password})async{
    return await _authService.createUser(email, password);
  }

  Future<void> login({required String email, required String password})async{
    return await _authService.signIn(email, password);
  }
}