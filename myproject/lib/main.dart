
import 'package:flutter/material.dart';
import 'package:myproject/my_app.dart';

import 'app_bootstrapper.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await AppBootstrapper.init(
    mainAppWidget: const MyApp(),
    runApp: runApp
  );
 
}
