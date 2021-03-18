import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static String sharedPreferencesUIDKey = "USERuid";
  static String sharedPreferencesNameKey = "USERname";
  static String sharedPreferencesBranchKey = "USERpersonality";
  static String sharedPreferencesBatchKey = "USERage";
  static Future<void> saveUserUid(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencesUIDKey, uid);
  }

  static Future<String> getUserUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencesUIDKey);
  }

  static Future<void> saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencesNameKey, name);
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencesNameKey);
  }

  static Future<void> saveUserPersonality(String personality) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencesBranchKey, personality);
  }

  static Future<String> getUserPersonality() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencesBranchKey);
  }

  static Future<void> saveUserAge(int age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(sharedPreferencesBatchKey, age);
  }

  static Future<int> getUserAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(sharedPreferencesBatchKey);
  }
}
