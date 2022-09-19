
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//config
import 'package:myproject/src/config/routes/app_router.dart';
import 'package:myproject/src/config/routes/routes.dart';

//constants
import 'src/helper/constants/app_color.dart';
import 'src/helper/constants/app_themes.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     const title = 'Assignment';
    const showDebugBanner = false;
    final platformIsIOS = Platform.isIOS;
    final app = platformIsIOS
        ? Theme(
            data: AppThemes.mainTheme,
            child: CupertinoApp(
              title: title,
              debugShowCheckedModeBanner: showDebugBanner,
              initialRoute: Routes.initialRoute,
              color: AppColors.primaryColor,
              onGenerateRoute: AppRouter.generateRoute,
              navigatorKey: AppRouter.navigatorKey,
            ),
          )
        : MaterialApp(
            title: title,
            //navigatorObservers: navigatorObservers,
            debugShowCheckedModeBanner: showDebugBanner,
            color: AppColors.primaryColor,
            theme: AppThemes.mainTheme,
            initialRoute: Routes.initialRoute,
            onGenerateRoute: AppRouter.generateRoute,
            navigatorKey: AppRouter.navigatorKey,
          );
    return app;
  }
}