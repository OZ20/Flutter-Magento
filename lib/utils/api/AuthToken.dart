import 'package:http/http.dart' as http;
import 'package:magentorx/model/Response.dart';
import 'package:magentorx/utils/api/GetCartITem.dart';
import 'package:magentorx/utils/pref/helper.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

class AuthToken {
  AuthToken({@required this.username, @required this.password});

  final username;
  final password;
  final baseUri = "http://magento.jomsoft.com/rest";

  Future<Response> getAdminToken() async {
    print("Username: $username  ||  Password: $password");
    var response =
        await http.post("$baseUri/default/V1/integration/admin/token",
            headers: {'Content-type': 'application/json'},
            body: json.encoder.convert({
              "username": username,
              "password": password,
            }));

    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }

  Future<Response> getCustomerToken() async {
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
      Helper.setToken(jsonDecode(response.body)).whenComplete(() => GetCartItem().getCartItem());
    }else
      Helper.isTokenValid = false;
    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }
}
