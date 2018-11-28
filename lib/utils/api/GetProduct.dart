
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class GetProduct {

  GetProduct({this.token, this.query});

  final token;
  final query;
  final baseUri = "http://magento.jomsoft.com/rest";

  Future getProduct({category})async{
    var uri = category == null?Uri.encodeFull("$baseUri/V1/products?searchCriteria[pageSize]=30"):Uri.encodeFull("$baseUri/V1/products?searchCriteria[pageSize]=30");
    var response = await http.get(uri,headers: <String,String>{
      "Authorization" : "Bearer $token",
      "Accept" : "application/json",
      "Content-Type" : "application/json"
    },);

    return jsonDecode(response.body);
  }

  Future searchProduct()async{
    var response = await http.get("$baseUri/V1/products?searchCriteria[filter_groups][0][filter][0][field]=name&"
        "searchCriteria[filter_groups][0][filter][0][value]=%$query%&"
        "searchCriteria[filter_groups][0][filter][0][condition_type]=like",headers: <String,String>{
      "Authorization" : "Bearer $token",
      "Accept" : "application/json",
      "Content-Type" : "application/json"
    },);

    return response.body;

  }

  Future getCategories()async{
    var uri = Uri.encodeFull("$baseUri/V1/categories");
    var response = await http.get(uri,headers: <String,String>{
      "Authorization" : "Bearer $token",
      "Accept" : "application/json",
      "Content-Type" : "application/json"
    },);
    return jsonDecode(response.body);
  }

}