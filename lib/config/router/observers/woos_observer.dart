import 'package:auto_route/auto_route.dart';

class WoosObserver extends AutoRouteObserver {
  bool _isWoosTabUpdated = false;

  bool get isWoosTabUpdated => _isWoosTabUpdated;

  void updateWoosTab() {
    _isWoosTabUpdated = true;
  }

  void resetWoosTabState() {
    _isWoosTabUpdated = false;
  }
}
