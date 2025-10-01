
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{
  static const _userIdKey = "userId";

  Future<void> storeUserId(String uid)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, uid);
  }

  Future<String?> getUserId()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }
}

// LocalStorageService();