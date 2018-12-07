import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:magentorx/model/Response.dart';

const baseUrl = "http://magento.jomsoft.com/rest";

class RegisterCustomer {
  RegisterCustomer(
      { this.fName,
       this.lName,
       this.email,
       this.password});

  final fName;
  final lName;
  final email;
  final password;

  Future<Response> registerCustomer() async {
    var body = jsonEncode({
      "customer": {
        "email": email,
        "firstname": fName,
        "lastname": lName,
      },
      "password": password
    });
    var response = await http.post("$baseUrl/V1/customers", headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    }, body: body);

    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }

  Future<Response> checkIsEmailAvailable() async {
    var response =
        await http.post("$baseUrl/V1/customers/isEmailAvailable", headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    }, body: {
          "email":email
        });

    return Response(statusCode: response.statusCode , response: jsonDecode(response.body));
  }
}
