
import 'package:first_project/core/service/auth_service.dart';

class AuthRepo {
  final authService = AuthService();

  Future<void> createUser(String email, String password) async {
    await authService.createUser( email, password);
  }
}