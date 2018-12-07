import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/model/Customer.dart';
import 'package:magentorx/model/Response.dart';
import 'package:magentorx/model/ShippingMethod.dart';
import 'package:magentorx/utils/api/GetCartITem.dart';
import 'package:magentorx/utils/pref/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartManagement {
  final baseUri = "http://magento.jomsoft.com/rest";

  Future<Response> createCart() async {
    final SharedPreferences _pref = await Helper.getPref();
    var token = _pref.get("TOKEN");
    var response = await http.post("$baseUri/default/V1/carts/mine", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });
    _pref.setString("QUOTEID", json.decode(response.body));
    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }

  Future<Response> addToCart({sku, qty}) async {
    final SharedPreferences _pref = await Helper.getPref();
    var token = _pref.get("TOKEN");
    var quoteID = _pref.get("QUOTEID");
    var response = await http
        .post("$baseUri/default/V1/carts/mine/items",
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            body: jsonEncode({
              "cartItem": {"sku": sku, "qty": qty, "quote_id": quoteID}
            }))
        .whenComplete(() => GetCartItem().getCartItem());
    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }

  Future<Response> removeFromCart({itemId}) async {
    var token = await Helper.getToken();
    var response = await http.delete(
      "$baseUri/default/V1/carts/mine/items/$itemId",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    ).whenComplete(() => GetCartItem().getCartItem());
    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }

  Future<Response> updateItemFromCart({qty, itemId}) async {
    final SharedPreferences _pref = await Helper.getPref();
    var token = _pref.get("TOKEN");
    var quoteID = _pref.get("QUOTEID");
    var response = await http
        .put("$baseUri/default/V1/carts/mine/items/$itemId",
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            body: jsonEncode({
              "cartItem": {"qty": qty, "quote_id": quoteID}
            }))
        .whenComplete(() => GetCartItem().getCartItem());
    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }

  Future<Response> estimateShippingMethods({Customer customer,int index}) async {
    var token = await Helper.getToken();
    var response = await http
        .post("$baseUri/default/V1/carts/mine/estimate-shipping-methods",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "address": {
            "region": customer.addresses[index].region.region,
            "region_id": customer.addresses[index].regionId,
            "region_code": customer.addresses[index].region.regionCode,
            "country_id": customer.addresses[index].countryId,
            "street": customer.addresses[index].street,
            "postcode": customer.addresses[index].postcode,
            "city": customer.addresses[index].city,
            "firstname": customer.addresses[index].fName,
            "lastname": customer.addresses[index].lName,
            "customer_id": customer.addresses[index].id,
            "email": customer.addresses[index].email,
            "telephone": customer.addresses[index].telephone,
            "same_as_billing": 1,
          },
        }));
    if(response.statusCode == 200)
      {
        List res = jsonDecode(response.body);
        Helper.shippingMethod.add(res.map((model) => ShippingMethod.fromJson(model)).toList());
      }

    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }

  Future<Response> setShippingAndBillingInfo({CartItem cart,int index}) async {
    final Customer customer = cart.customer;
    final BillingAddress billingAddress = cart.billingAddress;
    var body;
    var token = await Helper.getToken();
    var response = await http
        .post("$baseUri/default/V1/carts/mine/shipping-information",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: body = jsonEncode({
          "addressInformation": {
            "shipping_address": {
              "region": customer.addresses[index].region.region,
              "region_id": customer.addresses[index].region.regionId,
              "region_code": customer.addresses[index].region.regionCode,
              "country_id": customer.addresses[index].countryId,
              "street": customer.addresses[index].street,
              "postcode": customer.addresses[index].postcode,
              "city": customer.addresses[index].city,
              "firstname": customer.addresses[index].fName,
              "lastname": customer.addresses[index].lName,
              "email": customer.email,
              "telephone": customer.addresses[index].telephone,
            },
            "billing_address": {
              "region": billingAddress.region,
              "region_id": billingAddress.regionId,
              "region_code": billingAddress.regionCode,
              "country_id": billingAddress.countryId,
              "street": billingAddress.street,
              "postcode": billingAddress.postcode,
              "city": billingAddress.city,
              "firstname": billingAddress.fName,
              "lastname": billingAddress.lName,
              "email": billingAddress.email,
              "telephone": billingAddress.email
            },
            "shipping_carrier_code": "tablerate",
            "shipping_method_code": "bestway"
          }
        }));
    print(body);
    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }
}

