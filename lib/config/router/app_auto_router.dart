import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'app_auto_router.gr.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;
const _slideBottom = TransitionsBuilders.slideBottom;
const _slideLeft = TransitionsBuilders.slideLeft;

Route<T> swipeablePageRoute<T>(
  BuildContext _,
  Widget child,
  AutoRoutePage<T> page,
) {
  return SwipeablePageRoute<T>(
    builder: (_) => child,
    settings: page,
    canOnlySwipeFromEdge: true,
    fullscreenDialog: page.fullscreenDialog,
    maintainState: page.maintainState,
    transitionDuration: const Duration(
      milliseconds: _durationInMilliseconds,
    ),
  );
}

@AutoRouterConfig(
  replaceInRouteName: 'Page|Tab,Route',
)
class AppAutoRouter extends $AppAutoRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: _fadeIn,
        durationInMilliseconds: _durationInMilliseconds,
      );
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainRoute.page,
    ),
    AutoRoute(
      page: MapRoute.page,
    ),
  ];
}
