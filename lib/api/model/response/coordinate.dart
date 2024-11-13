import 'package:json_annotation/json_annotation.dart';

part 'coordinate.g.dart';

@JsonSerializable()
class Coordinate {
  final int x;
  final int y;

  Coordinate({
    required this.x,
    required this.y,
  });

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return _$CoordinateFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}
