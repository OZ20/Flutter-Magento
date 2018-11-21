
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class GetProduct {

  GetProduct({@required this.token, this.query});

  final token;
  final query;

  getProduct(){
    http.get("http://magento.jomsoft.com/");
  }

}