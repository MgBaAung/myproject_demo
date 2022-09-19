import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/// A wrapper class that contains methods to bootstrap the app launch.
///
/// It initializes the important services at app startup to allow
/// syncronous access to them later on.
class AppBootstrapper {
  const AppBootstrapper._();

  /// Initializer for important and asyncronous app services
  /// Should be called in main after `WidgetsBinding.FlutterInitialized()`.
  ///
  /// [mainAppWidget] is the first widget that loads on app startup.
  /// [runApp] is the main app binding method that launches our [mainAppWidget].
  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
     ///run main
    _setupSentrySDK(runApp,mainAppWidget);

    // For restricting the app to portrait mode only
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static _setupSentrySDK(
    void Function(Widget) appRunner,
    Widget app,
  ){
    appRunner(app);
  }
    
}
