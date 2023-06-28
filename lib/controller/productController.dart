import 'package:get/state_manager.dart';
import '../model/ProductModel.dart';
import 'apiGetx.dart';

class ProductController extends GetxController {
  var isloading = true.obs;
  var productList = <Products>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isloading(true);
      var products = await Api.fetchProducts();
      if (products != null) {
        productList.value = products as List<Products>;
      }
    } finally {
      isloading(false);
    }
  }
}
