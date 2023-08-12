import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  static Future<void> setEmail(String email) async {
    await instance.setString("email", email);
  }

  static String getEmail() {
    return instance.getString("email") ?? "None";
  }
}
