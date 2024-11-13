import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/di/locator.dart';

mixin BlocAutoRouteMixin<T extends /* Cubit */ StateStreamableSource<Object?>>
    on Widget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<T>(),
      child: this,
    );
  }
}
