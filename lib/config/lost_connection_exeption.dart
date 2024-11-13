import '../exceptions/base_exception.dart';
import '../models/lost_connection_type.dart';

class LostConnectionException implements BaseException {
  final LostConnectionType lostConnectionType;

  LostConnectionException(
    this.lostConnectionType,
  );
}
