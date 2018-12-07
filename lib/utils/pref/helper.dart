import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/model/Customer.dart';
import 'package:magentorx/model/Product.dart';
import 'package:magentorx/model/ProductDetail.dart';
import 'package:magentorx/model/ShippingMethod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {

  static final PublishSubject<String> token = PublishSubject();
  static final ReplaySubject<Customer> customer = ReplaySubject();
  static final ReplaySubject<CartItem> cartItem = ReplaySubject();
  static final ReplaySubject<List<ShippingMethod>> shippingMethod = ReplaySubject();
  static final ReplaySubject<Product> product = ReplaySubject();
  static final ReplaySubject<ProductDetail> productDetail = ReplaySubject();

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

  static void close() {
    customer?.close();
    token?.close();
    cartItem?.close();
    shippingMethod?.close();
    product?.close();
    productDetail?.close();
  }

  static void logout(){
    getPref().then((pref) => pref.clear()).whenComplete(() => print("Logged out"));
    isTokenValid = false;
  }

}
