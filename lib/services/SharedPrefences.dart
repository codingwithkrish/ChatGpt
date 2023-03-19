import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future<void> login(
      String email, String uid, String name, String imageurl) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", true);
    await prefs.setString("email", email);
    await prefs.setString("uid", uid);
    await prefs.setString("name", name);
    await prefs.setString("imageurl", imageurl);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", false);
    await prefs.setString("email", "");
    await prefs.setString("uid", "");
    await prefs.setString("name", "");
    await prefs.setString("imageurl", "");
  }

  Future<bool?> getuserlogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("login");
  }

  Future<String?> getuseremail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  Future<String?> getusername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  Future<String?> getuserurl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("imageurl");
  }
}
