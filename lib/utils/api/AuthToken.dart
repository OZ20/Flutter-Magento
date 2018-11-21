import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

class AuthToken {
  AuthToken({@required this.username, @required this.password});

  final username;
  final password;

  Future<Map> getAdminToken() async {
    print("Username: $username  ||  Password: $password");
    var response = await http.post(
        "http://magento.jomsoft.com/rest/default/V1/integration/admin/token",
        headers: {'Content-type': 'application/json'},
        body: json.encoder.convert({
          "username": username,
          "password": password,
        }));

      return {"statuscode": response.statusCode, "response": json.decode(response.body)};
  }

  Future<Map> getCustomerToken() async {
    print("Username: $username  ||  Password: $password");
    var response = await http.post(
        "http://magento.jomsoft.com/rest/default/V1/integration/customer/token",
        headers: {'Content-type': 'application/json'},
        body: json.encoder.convert({
          "username": username,
          "password": password,
        }));
    return {"statuscode": response.statusCode, "response": response.body};
  }
}
