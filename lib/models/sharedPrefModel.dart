import 'package:envision/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  setFirstLogin(bool value) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    sharedPref.setBool(firstLogin, value);
  }

  getFirstLogin() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool(firstLogin);
  }
}
