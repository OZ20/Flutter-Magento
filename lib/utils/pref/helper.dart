import 'package:magentorx/model/CartItem.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {

  static final PublishSubject<String> token = PublishSubject();
  static final ReplaySubject<CartItem> cartItem = ReplaySubject();
  static bool isTokenValid;


  static Future<SharedPreferences> getPref() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref;
  }

  static Future<String> getToken() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.get("TOKEN");
  }

  static Future<bool> setToken(String value) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    token.add(value);
    return _pref.setString("TOKEN", value);
  }

  void close() {
    token?.close();
    cartItem?.close();
  }

}
