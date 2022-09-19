import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//config
import 'package:myproject/src/features/app_startup/app_startup_screen.dart';

//constants
import 'src/helper/constants/app_color.dart';
import 'src/helper/constants/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Assignment';
    const showDebugBanner = false;
    return ScreenUtilInit(
        designSize: const Size(375, 812),
      
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: title,
            
            debugShowCheckedModeBanner: showDebugBanner,
            color: AppColors.primaryColor,
            theme: AppThemes.mainTheme,
            home: AppStartupScreen(),
          );
        });
  }
}
