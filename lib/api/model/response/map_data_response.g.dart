// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapDataResponse _$MapDataResponseFromJson(Map<String, dynamic> json) =>
    MapDataResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MapDataResponseToJson(MapDataResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };
