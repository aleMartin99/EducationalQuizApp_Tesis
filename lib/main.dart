import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

import 'injection_container/init_dependencies.dart';
import '/../core/core.dart';

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

  runApp(EasyDynamicThemeWidget(
    child: const AppWidget(),
  ));

  //runApp(const AppWidget());
}
