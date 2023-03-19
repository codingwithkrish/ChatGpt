import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  bool? loggin;
  MainController() {}
  Future<bool?> getuserinfo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("login");
  }
}
