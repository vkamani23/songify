extension StringExt on Duration {
  String formatDurationToString() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);
    return "${twoDigits(minutes)}:${twoDigits(seconds)}";
  }
}

extension CompareListExt on List {
  bool compareListsUnordered<T>(List<T> list2) {
    if (length != list2.length) return false;
    final set1 = toSet();
    final set2 = list2.toSet();
    return set1.length == set2.length && set1.containsAll(set2);
  }
}
