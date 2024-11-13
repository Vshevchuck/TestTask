import 'package:json_annotation/json_annotation.dart';
import 'package:test_task/api/model/response/data.dart';

part 'map_data_response.g.dart';

@JsonSerializable()
class MapDataResponse {
  final bool error;
  final String message;
  final List<Data> data;

  factory MapDataResponse.fromJson(Map<String, dynamic> json) {
    return _$MapDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MapDataResponseToJson(this);

  MapDataResponse({
    required this.error,
    required this.message,
    required this.data,
  });
}
