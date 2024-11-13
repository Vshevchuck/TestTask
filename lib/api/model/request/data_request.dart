// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:test_task/api/model/response/coordinate.dart';

part 'data_request.g.dart';

@JsonSerializable()
class DataRequest {
  final String id;
  final String path;
  final Coordinate start;
  final Coordinate end;

  DataRequest({
    required this.id,
    required this.path,
    required this.start,
    required this.end,
  });

  factory DataRequest.fromJson(Map<String, dynamic> json) {
    return _$DataRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DataRequestToJson(this);
}
