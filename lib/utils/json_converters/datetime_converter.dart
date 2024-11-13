// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json_annotation/json_annotation.dart';

// class DateTimeJsonConverter
//     implements JsonConverter<DateTime, /*Timestamp*/ dynamic> {
//   const DateTimeJsonConverter();

//   @override
//   DateTime fromJson(dynamic json) {
//     if (json is DateTime) return json;
//     if (json is Timestamp) return json.toDate();

//     return Timestamp(json['_seconds'], json['_nanoseconds']).toDate();
//   }

//   @override
//   dynamic toJson(DateTime object) {
//     return Timestamp.fromDate(object);
//   }
// }

// class NullableDateTimeJsonConverter
//     implements JsonConverter<DateTime?, /*Timestamp*/ dynamic> {
//   final DateTimeJsonConverter _serializer;
//   const NullableDateTimeJsonConverter()
//       : _serializer = const DateTimeJsonConverter();

//   @override
//   DateTime? fromJson(dynamic json) {
//     if (json == null) return null;
//     return _serializer.fromJson(json);
//   }

//   @override
//   dynamic toJson(DateTime? object) {
//     if (object == null) return null;
//     return _serializer.toJson(object);
//   }
// }
