import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magentorx/utils/pref/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetProfile {
  final baseUri = "http://magento.jomsoft.com/rest";

  Future getProfile() async {
    final SharedPreferences _pref = await Helper.getPref();
    var token = _pref.get("TOKEN");
    var response = await http.get("$baseUri/V1/customers/me", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode == 200) {
      Helper.isTokenValid = true;
    } else {
      Helper.isTokenValid = false;
    }

    return {
      "statuscode": response.statusCode,
      "response": json.decode(response.body)
    };
  }
}
