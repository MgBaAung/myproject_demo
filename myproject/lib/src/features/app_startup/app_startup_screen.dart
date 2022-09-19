import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:myproject/src/features/auth/screen/login_screen.dart';
import 'package:myproject/src/features/view_screen/view_all_product.dart';
import 'package:myproject/src/helper/constants/app_utils.dart';
import 'package:myproject/src/helper/constants/context_extension.dart';
import 'package:myproject/src/helper/constants/lottie_assets.dart';

import '../auth/controller/auth_controller.dart';
import '../auth/repository/auth_repository.dart';

class AppStartupScreen extends StatelessWidget {
  AppStartupScreen({super.key});
  final authController = Get.put(AuthController(AuthRepository(Dio())));

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (authController.auth.value) {
          return const ViewAllProduct();
        } else if (!authController.auth.value) {
          return const LoginScreen();
        } else {
          return const LottieAnimationLoader();
        }
      },
    );
  }
}

class LottieAnimationLoader extends StatelessWidget {
  const LottieAnimationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    const loaders = [
      LottieAssets.femaleWalkingLottie,
      LottieAssets.movingBusLottie,
      LottieAssets.peopleTalkingLottie,
    ];
    final i = AppUtils.randomizer().nextInt(3);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          loaders[i],
          width: context.screenWidth,
        ),
      ),
    );
  }
}
