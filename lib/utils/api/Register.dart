import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = "http://magento.jomsoft.com/rest";

class RegisterCustomer {

  RegisterCustomer(this.fName, this.lName, this.email, this.password);

  final fName;
  final lName;
  final email;
  final password;

  Future registerCustomer()async{
    var response = await http.post(
        "$baseUrl/V1/customers", headers: {
      "Content-Type": "application/json"
    }, body: {
      "customer": {
        "email": email,
        "firstname": fName,
        "lastname": lName,
      },
      "password": password
    });

    return jsonDecode(response.body);
  }

  Future checkIsEmailAvailable()async{
    var response = await http.post("$baseUrl/V1/customers/isEmailAvailable",headers: {
      "Content-Type": "application/json"
    }, body: {

    });
    
    return jsonDecode(response.body);
  }

}