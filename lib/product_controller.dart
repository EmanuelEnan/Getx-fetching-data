import 'package:get/get.dart';
import 'package:getx_test/product.dart';
import 'package:getx_test/remote_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
