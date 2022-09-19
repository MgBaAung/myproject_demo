import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static const String tokenKey = "token";

  static Future<void> setToken(String token) async {
    final shp = await SharedPreferences.getInstance();
    await shp.setString(tokenKey, token);
  }

  static Future<String?> getToken() async {
    final shp = await SharedPreferences.getInstance();
    final token = shp.getString(tokenKey);
    return token;
  }
}
