import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/model/Response.dart';
import 'package:magentorx/utils/pref/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetCartItem {
  final baseUri = "http://magento.jomsoft.com/rest";

  Future<Response> getCartItem() async {
    final SharedPreferences _pref = await Helper.getPref();
    var token = _pref.get("TOKEN");
    var response = await http.get("$baseUri/V1/carts/mine", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode == 200) {
      Helper.isTokenValid = true;
      var cartItem = CartItem.fromJson(jsonDecode(response.body));
      Helper.cartItem.add(cartItem);
    } else
      Helper.isTokenValid = false;

    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }
}
