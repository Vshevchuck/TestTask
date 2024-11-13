extension ListExt<T> on List<T> {
  /// ```
  /// [1, 2, 3].rotate(-1) // [ 3, 1, 2 ]
  /// [1, 2, 3].rotate( 0) // [ 1, 2, 3 ]
  /// [1, 2, 3].rotate( 1) // [ 2, 3, 1 ]
  /// [1, 2, 3].rotate( 2) // [ 3, 1, 2 ]
  /// [1, 2, 3].rotate( 2) // [ 1, 2, 3 ]
  /// [1, 2, 3].rotate( 4) // [ 2, 3, 1 ]
  /// ```
  List<T> rotate(int n) {
    if (isEmpty) return this;
    int pivot = n % length;
    return sublist(pivot)..addAll(sublist(0, pivot));
  }

  Iterable<Iterable<T>> split(int sublistSize) sync* {
    for (var list = this;
        list.isNotEmpty;
        list = list.skip(sublistSize).toList()) {
      yield list.take(sublistSize);
    }
  }
}
