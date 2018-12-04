import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magentorx/utils/pref/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetCartItem {

  final baseUri = "http://magento.jomsoft.com/rest";


  Future getCartItem()async{
    final SharedPreferences _pref =  await SharedPref.getPref();
    var token = _pref.get("TOKEN");
    var cartId = _pref.get("QUOTEID");
    print("Token: $token  CartId: $cartId");
    var response = await http.get("$baseUri/V1/carts/mine",headers: {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer $token",
    });
    return {"statuscode": response.statusCode, "response": json.decode(response.body)};
  }
}