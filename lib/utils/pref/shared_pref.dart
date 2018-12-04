
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {


  static Future<SharedPreferences> getPref() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
     return _pref;
  }
}