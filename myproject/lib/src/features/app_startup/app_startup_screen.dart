


import 'package:flutter/material.dart';

//lottie
import 'package:lottie/lottie.dart';
import 'package:myproject/src/features/auth/screen/login_screen.dart';
import 'package:myproject/src/features/auth/screen/register_screen.dart';
import 'package:myproject/src/features/cart_screen/cart_screen.dart';
import 'package:myproject/src/features/view_detail_screen/view_detail_screen.dart';
import 'package:myproject/src/helper/constants/app_utils.dart';
import 'package:myproject/src/helper/constants/context_extension.dart';
import 'package:myproject/src/helper/constants/lottie_assets.dart';

import '../view_screen/view_all_product.dart';
import 'welcome_screen.dart';

class AppStartupScreen extends StatelessWidget {
  const AppStartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const CartScreen();
    
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
