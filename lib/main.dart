import 'package:flutter/material.dart';
import 'package:trivia_educativa/core/app_widget.dart';
import 'package:get_it/get_it.dart';

import 'core/api_constants.dart';
import 'injection_container/init_dependencies.dart';

final sl = GetIt.I;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize all dependencies with the given GetIt service locator as
  await initDependencies(
    sl,
    apiBaseUrl: kApiOldServer,
    //*Check when authetication carlos
    // apiBaseUrl: kApiProductionBaseUrl,
  );

// runApp(EasyDynamicThemeWidget(
//     child: const MyApp(),
//   ));

  runApp(const AppWidget());
}
