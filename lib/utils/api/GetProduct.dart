
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class GetProduct {

  GetProduct({@required this.token, this.query});

  final token;
  final query;

  final baseUri = "http://magento.jomsoft.com/rest";

  Future getProduct()async{
    print(token);
    var response = await http.get("$baseUri/V1/products",headers: <String,String>{
      "Authorization" : "Bearer $token",
      "Accept" : "application/json",
      "Content-Type" : "application/json"
    });

    return response.body;
  }

}