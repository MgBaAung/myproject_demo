import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:myproject/src/features/auth/repository/auth_repository.dart';
import 'package:myproject/src/helper/exception.dart';
import 'package:myproject/src/helper/sharepref.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;
  AuthController(this._authRepository);
  RxBool auth = false.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;

  @override
  void onInit() {
    isAuthenticate();
    super.onInit();
  }

  addError(String e) {
    errorMessage(e);
    Future.delayed(const Duration(seconds: 1), () {
      errorMessage("");
    });
  }

  addLoading() {
    isLoading(true);
  }

  removeLoading() {
    isLoading(false);
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
      addLoading();
      final token = await _authRepository.login(name, password);
      await SharePref.setToken(token);
      authorize();
      removeLoading();
    } on DioError catch (e) {
      addError(DioException.fromDioError(e).message);
      unAuthorize();
      removeLoading();
    }
  }

  Future<void> register(
      {required String name, required String password}) async {
    try {
      addLoading();
      await _authRepository.register(name, password);
      authorize();
      removeLoading();
    } on DioError catch (e) {
      addError(DioException.fromDioError(e).message);
      unAuthorize();
      removeLoading();
    }
  }

  Future<void> logout() async {
    await SharePref.clear();
    unAuthorize();
  }
}
