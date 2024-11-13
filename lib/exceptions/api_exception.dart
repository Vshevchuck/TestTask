import 'base_exception.dart';

class ApiException implements BaseException {
  final int? statusCode;
  final String? detail;
  final String message;

  const ApiException({
    required this.message,
    this.statusCode,
    this.detail,
  });

  @override
  String toString() {
    return '$message ${detail != null ? ": [$detail]" : ""}';
  }
}
