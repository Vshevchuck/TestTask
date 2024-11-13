// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_task/api/model/response/coordinate.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final String id;
  final List<String> field;
  final Coordinate start;
  final Coordinate end;

  Data({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
