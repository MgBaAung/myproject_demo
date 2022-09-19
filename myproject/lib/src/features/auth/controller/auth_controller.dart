import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:myproject/src/features/auth/repository/auth_repository.dart';
import 'package:myproject/src/helper/sharepref.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;
  AuthController(this._authRepository);
  RxBool auth = false.obs;
  RxString errorMessage = "".obs;

  @override
  void onInit() {
    isAuthenticate();
    super.onInit();
  }

  authorize() {
    auth(true);
  }

  unAuthorize() {
    auth(false);
  }

  isAuthenticate() async {
    final token = await SharePref.getToken();
    if (token == null) {
      unAuthorize();
    } else {
      authorize();
    }
  }

   Future<void> login({required String name, required String password}) async {
    try {
      final token = await _authRepository.login(name, password);
      await SharePref.setToken(token);
      authorize();
    } on DioError catch (e) {
      errorMessage(e.message);
      unAuthorize();
    }
  }

  Future<void>register({required String name, required String password}) async {
    try {
      final token = await _authRepository.login(name, password);
      await SharePref.setToken(token);
      authorize();
    } on DioError catch (e) {
      errorMessage(e.message);
      unAuthorize();
    }
  }
}
