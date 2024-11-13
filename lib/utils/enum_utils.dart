import 'package:collection/collection.dart';

import 'extensions/string_ext.dart';

String _enumToString<TEnum>(TEnum enumValue) {
  if (enumValue == null) return '';
  final String description = enumValue.toString();
  final int indexOfDot = description.indexOf('.');
  assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$enumValue" is not an enum.',
  );
  return description.substring(indexOfDot + 1);
}

/// Convert enum value to string
String enumToSnakeString<TEnum>(TEnum val) => _enumToString(val).toSnakeCase();

/// Convert enum value to string
String enumToScreamingSnakeString<TEnum>(TEnum val) {
  return _enumToString(val).toScreamingSnakeCase();
}

/// Convert enum value to string
String enumToCamelString<TEnum>(TEnum val) => _enumToString(val).toCamelCase();

/// Convert enum value to string
String enumToTitleString<TEnum>(TEnum val) => _enumToString(val).toTitleCase();

/// Convert string to enum value
TEnum enumFromString<TEnum>(
  String? key,
  List<TEnum> enumValues,
  TEnum defaultValue,
) {
  return enumFromStringOrNull(key, enumValues) ?? defaultValue;
}

/// Convert string to enum value
TEnum? enumFromStringOrNull<TEnum>(
  String? key,
  List<TEnum> enumValues,
) {
  return enumValues.firstWhereOrNull((value) {
    final possibleCases = [
      enumToCamelString(value),
      enumToSnakeString(value),
      enumToScreamingSnakeString(value),
      enumToTitleString(value),
    ];
    return possibleCases.contains(key);
  });
}
