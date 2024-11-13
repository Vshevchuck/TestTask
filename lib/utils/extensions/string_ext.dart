import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import 'build_context_ext.dart';

extension StringExt on String {
  static const minLengthPrimary = 120;
  static const minLengthSecondary = 56;

  bool get isLongPrimary => length > minLengthPrimary;

  bool get isLongSecondary => length > minLengthSecondary;

  String get getUpTo120chars {
    if (!isLongPrimary) return this;
    return '${substring(0, minLengthPrimary)}...';
  }

  String get getUpTo56chars {
    if (!isLongSecondary) return this;
    return '${substring(0, minLengthSecondary)}...';
  }

  String toCamelCase() => camelCase;
  String toSnakeCase() => snakeCase;
  String toScreamingSnakeCase() => constantCase;
  String toTitleCase() => titleCase;

  // String possessiveSingle(BuildContext context) {
  // return '$this${context.strings.possessiveCase}';
  //}

  String removeSpaces() {
    return replaceAll(' ', '');
  }
}
