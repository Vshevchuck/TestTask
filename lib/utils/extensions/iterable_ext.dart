extension IterableExt<T> on Iterable<T> {
  List<T> insertSeparator(
    T Function() separator, {
    bool hasEndSeparator = false,
  }) {
    if (isEmpty) return toList();

    final result = <T>[];
    result.add(first);
    for (var element in skip(1)) {
      result.add(separator());
      result.add(element);
    }
    if (hasEndSeparator) {
      result.add(separator());
    }
    return result;
  }
}
