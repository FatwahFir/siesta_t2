import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var offset = 0;
  var limit = 10;

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  Future<void> fetchProducts({bool isRefresh = false}) async {
    if (isRefresh) {
      offset = 0;
      isRefreshing.value = true;
    } else {
      offset += limit;
    }
    isLoading.value = true;

    try {
      final newProducts =
          await ApiService.fetchProducts(offset: offset, limit: limit);
      if (isRefresh) {
        products.value = newProducts;
      } else {
        products.addAll(newProducts);
      }
    } finally {
      isLoading.value = false;
      isRefreshing.value = false;
    }
  }
}
