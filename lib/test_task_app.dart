import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'config/di/locator.dart';
import 'config/router/app_auto_router.dart';
import 'config/router/app_auto_router.gr.dart';
import 'config/themes/light/light_theme.dart';
import 'config/themes/main_theme.dart';
import 'l10n/test_localizations.dart';

class TestTaskApp extends StatelessWidget {
  const TestTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTheme(
      theme: LightThemeData(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          final appRouter = locator<AppAutoRouter>();
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: MainTheme.of(context).themeData,
            locale: const Locale('en'),
            localizationsDelegates: TestLocalizations.localizationsDelegates,
            supportedLocales: TestLocalizations.supportedLocales,
            routeInformationParser: appRouter.defaultRouteParser(),
            routeInformationProvider: appRouter.routeInfoProvider(),
            routerDelegate: appRouter.delegate(
              deepLinkBuilder: ((deepLink) => const DeepLink(
                    kDebugMode ? [OnboardingRoute()] : [],
                  )),
              navigatorObservers: () => [],
            ),
          );
        },
      ),
    );
  }
}
