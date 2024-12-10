extension $IterableExtension<T> on Iterable<T> {
  T? get firstOrNull {
    return isEmpty ? null : first;
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  bool isIn(Iterable<T> other) {
    for (var value in this) {
      if (!other.contains(value)) return false;
    }
    return true;
  }

  Iterable<T> mapIndexed(T Function(T element, int index) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(T element, int index) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }

  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    return fold(
      <K, List<T>>{},
      (previousValue, element) {
        final key = keyFunction(element);
        final list = previousValue[key] ?? [];
        list.add(element);
        previousValue[key] = list;
        return previousValue;
      },
    );
  }
}

extension $NullableIterableExtension<T> on Iterable<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNullOrNotEmpty => this != null && this!.isNotEmpty;
}

