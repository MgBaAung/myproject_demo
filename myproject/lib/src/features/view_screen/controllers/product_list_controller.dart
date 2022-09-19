import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:myproject/src/features/view_screen/repository/product_repository.dart';

import '../model/product_list_response.dart';

class ProductListController extends GetxController {
  final ProductRepository _productRepository;
  ProductListController(this._productRepository);

  var productList = <Product>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;

  getProducts() async {
    try {
      isLoading(true);
      final list = await _productRepository.getProductList();
      productList(list);
      isLoading(false);
    } on DioError catch (e) {
      isLoading(false);
      errorMessage(e.message);
    }
  }
}
