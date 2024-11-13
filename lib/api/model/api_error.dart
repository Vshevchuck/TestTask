import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError extends Equatable {
  final int status;
  final String? detail;
  final String message;

  const ApiError({
    required this.status,
    required this.detail,
    required this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return _$ApiErrorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @override
  List<Object?> get props {
    return [
      status,
      detail,
      message,
    ];
  }
}
