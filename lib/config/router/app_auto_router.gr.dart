// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:test_task/api/model/response/coordinate.dart' as _i5;
import 'package:test_task/pages/main_page/main_page.dart' as _i1;
import 'package:test_task/pages/map_page/map_page.dart' as _i2;

abstract class $AppAutoRouter extends _i3.RootStackRouter {
  $AppAutoRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: const _i1.MainPage()),
      );
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.MapPage(
          key: args.key,
          field: args.field,
          coordinates: args.coordinates,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MapPage]
class MapRoute extends _i3.PageRouteInfo<MapRouteArgs> {
  MapRoute({
    _i4.Key? key,
    required List<String> field,
    required List<_i5.Coordinate> coordinates,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          MapRoute.name,
          args: MapRouteArgs(
            key: key,
            field: field,
            coordinates: coordinates,
          ),
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const _i3.PageInfo<MapRouteArgs> page =
      _i3.PageInfo<MapRouteArgs>(name);
}

class MapRouteArgs {
  const MapRouteArgs({
    this.key,
    required this.field,
    required this.coordinates,
  });

  final _i4.Key? key;

  final List<String> field;

  final List<_i5.Coordinate> coordinates;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, field: $field, coordinates: $coordinates}';
  }
}
