import 'package:http/http.dart' as http;
import '../model/Constants.dart';
import '../model/ProductModel.dart';

class Api{
  static var client = http.Client();

  static Future<List?> fetchProducts() async {
    String url = BaseUrl;
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }

  }
}