// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json_annotation/json_annotation.dart';

// import '../../config/di/locator.dart';

// class DocumentReferenceSerializer
//     implements JsonConverter<DocumentReference<Map<String, dynamic>>, dynamic> {
//   const DocumentReferenceSerializer();

//   @override
//   DocumentReference<Map<String, dynamic>> fromJson(
//     dynamic map,
//   ) {
//     if (map is DocumentReference<Map<String, dynamic>>) return map;
//     final path = map['_path']['segments'].join('/');
//     return locator<FirebaseFirestore>().doc(path);
//   }

//   @override
//   dynamic toJson(
//     DocumentReference<Map<String, dynamic>> docRef,
//   ) {
//     return docRef;
//   }
// }

// class NullableDocumentReferenceSerializer
//     implements
//         JsonConverter<DocumentReference<Map<String, dynamic>>?, dynamic> {
//   final DocumentReferenceSerializer _serializer;
//   const NullableDocumentReferenceSerializer()
//       : _serializer = const DocumentReferenceSerializer();

//   @override
//   DocumentReference<Map<String, dynamic>>? fromJson(dynamic json) {
//     if (json == null) return null;
//     return _serializer.fromJson(json);
//   }

//   @override
//   dynamic toJson(DocumentReference<Map<String, dynamic>>? object) {
//     if (object == null) return null;
//     return _serializer.toJson(object);
//   }
// }

// class ListDocumentReferenceSerializer
//     implements
//         JsonConverter<List<DocumentReference<Map<String, dynamic>>>, List<dynamic>> {
//   final DocumentReferenceSerializer _serializer;
//   const ListDocumentReferenceSerializer()
//       : _serializer = const DocumentReferenceSerializer();

//   @override
//   List<DocumentReference<Map<String, dynamic>>> fromJson(List<dynamic> jsons) {
//     return jsons.map((json) => _serializer.fromJson(json)).toList();
//   }

//   @override
//   List<dynamic> toJson(List<DocumentReference<Map<String, dynamic>>> objects) {
//     return objects.map((object) => _serializer.toJson(object)).toList() ;
//   }
// }
