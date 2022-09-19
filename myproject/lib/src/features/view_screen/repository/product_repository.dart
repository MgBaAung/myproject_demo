import 'package:dio/dio.dart';
import 'package:myproject/src/core/networking/api_endpoint.dart';
import 'package:myproject/src/features/view_screen/model/product_list_response.dart';
import 'package:myproject/src/helper/sharepref.dart';

class ProductRepository {
  final Dio _dio;
  ProductRepository(this._dio);

  Future<List<Product>?> getProductList() async {
    try {
      final token = await SharePref.getToken();

      final result = await _dio.get(
        ApiEndPoint.productListUrl,
        queryParameters: {"page": 1, "size": 10},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json; charset=UTF-8',
            "authorization": "Bearer $token"
          },
        ),
      );
      final productResp = ProductListResponse.fromJson(result.data);
      final List<Product>? productList = productResp.content;
      return productList;
    } on DioError {
      rethrow;
    }
  }
}
