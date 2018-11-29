import 'package:magentorx/model/Category.dart';
import 'package:magentorx/model/Product.dart';
import 'package:magentorx/utils/api/GetProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  Future<List<CategoryModel>> getCategory()async{
    return GetProduct()
        .getCategories()
        .then((res) => CategoryModel.fromJson(res).childrenData);
  }

  Future<List<Product>> getProduct({category})async{
    List<Product> _productList = new List();
    await GetProduct(categoryId: category)
        .getProduct()
        .then((res) => res["items"])
        .then((item) =>
            item.forEach((data) => _productList.add(Product.fromJson(data)))).whenComplete(() => print("get product"));
    return _productList;
  }

}
