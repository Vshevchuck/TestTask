import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/di/di.dart';
import 'config/hive_init.dart';
import 'test_task_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const TestTaskApp(),
  );
}
