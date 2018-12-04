import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magentorx/utils/pref/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddToCart {

  AddToCart();

  final baseUri = "http://magento.jomsoft.com/rest";



  Future<Map<String,dynamic>> createCart()async{
    final SharedPreferences _pref = await SharedPref.getPref();
    var token = _pref.get("TOKEN");
    var response = await http.post("$baseUri/default/V1/carts/mine",headers: {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer $token",
    });
    _pref.setString("QUOTEID", json.decode(response.body));
    return {"statuscode": response.statusCode, "response": json.decode(response.body)};
  }

  Future<Map<String,dynamic>> addToCart({sku,qty})async{
    final SharedPreferences _pref = await SharedPref.getPref();
    var token = _pref.get("TOKEN");
    var quoteID = _pref.get("QUOTEID");
    var response = await http.post("$baseUri/default/V1/carts/mine/items",headers: {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer $token",
    },body: jsonEncode({
      "cartItem": {
        "sku": sku,
        "qty": qty,
        "quote_id": quoteID
      }
    })).whenComplete(() => print("$sku,$qty,$quoteID"));
    return {"statuscode": response.statusCode, "response": json.decode(response.body)};
  }


}