import 'package:injectable/injectable.dart';

import '../../api/model/response/coordinate.dart';
import '../di/locator.dart';
import 'app_auto_router.dart';
import 'app_auto_router.gr.dart';
import 'base_router.dart';

/// Getter (NOT a final variable) to allow Hot Reloading
/// with new routes without restart
VinchestaRouter get router => locator<VinchestaRouter>();

@singleton
class VinchestaRouter extends BaseRouter {
  VinchestaRouter(AppAutoRouter super.router);
}
