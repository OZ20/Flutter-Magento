import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterCustomer {

  RegisterCustomer(this.fName, this.lName, this.email, this.password);

  final fName;
  final lName;
  final email;
  final password;

  Future registerCustomer()async{
    var response = await http.post(
        "http://magento.jomsoft.com/rest/V1/customers", headers: {
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

}