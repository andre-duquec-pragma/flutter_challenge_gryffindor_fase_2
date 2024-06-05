enum SearchCriteriaPriority {
  high(value: 1),
  low(value: 2);

  final int value;

  const SearchCriteriaPriority({
    required this.value,
  });
}
