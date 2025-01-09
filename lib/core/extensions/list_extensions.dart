extension ListExtension<T> on List<T> {
  List<T> addBetween(T separator) {
    if (length <= 1) toList();

    final newList = <T>[];

    for (var i = 0; i < length; i++) {
      newList.add(this[i]);
      if (i < length - 1) newList.add(separator);
    }

    return newList;
  }
}
