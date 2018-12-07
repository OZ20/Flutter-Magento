import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magentorx/model/Response.dart';
import 'package:magentorx/utils/pref/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetProfile {
  final baseUri = "http://magento.jomsoft.com/rest";

  Future<Response> getProfile() async {
    var token = await Helper.getToken();
    var response = await http.get("$baseUri/V1/customers/me", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode == 200) {
      Helper.isTokenValid = true;
    } else {
      Helper.isTokenValid = false;
    }

    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }
}
