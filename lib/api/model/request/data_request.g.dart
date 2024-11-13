// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRequest _$DataRequestFromJson(Map<String, dynamic> json) => DataRequest(
      id: json['id'] as String,
      path: json['path'] as String,
      start: Coordinate.fromJson(json['start'] as Map<String, dynamic>),
      end: Coordinate.fromJson(json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataRequestToJson(DataRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'start': instance.start,
      'end': instance.end,
    };
