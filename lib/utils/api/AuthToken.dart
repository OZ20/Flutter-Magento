import 'package:http/http.dart' as http;
import 'package:magentorx/utils/pref/helper.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

class AuthToken {
  AuthToken({@required this.username, @required this.password});

  final username;
  final password;
  final baseUri = "http://magento.jomsoft.com/rest";

  Future<Map<String, dynamic>> getAdminToken() async {
    print("Username: $username  ||  Password: $password");
    var response =
        await http.post("$baseUri/default/V1/integration/admin/token",
            headers: {'Content-type': 'application/json'},
            body: json.encoder.convert({
              "username": username,
              "password": password,
            }));

    return {
      "statuscode": response.statusCode,
      "response": json.decode(response.body)
    };
  }

  Future<Map<String, dynamic>> getCustomerToken() async {
    print("Username: $username  ||  Password: $password");
    var response =
        await http.post("$baseUri/default/V1/integration/customer/token",
            headers: {'Content-type': 'application/json'},
            body: json.encoder.convert({
              "username": username,
              "password": password,
            }));

    if(response.statusCode == 200){
      Helper.isTokenValid = true;
      Helper.setToken(jsonDecode(response.body));
    }else
      Helper.isTokenValid = false;
    return {
      "statuscode": response.statusCode,
      "response": json.decode(response.body)
    };
  }
}
