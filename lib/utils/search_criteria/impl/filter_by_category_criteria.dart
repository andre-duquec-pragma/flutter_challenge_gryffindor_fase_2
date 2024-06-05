import '../filter_criteria.dart';

/// A criteria to define a category filter in products related requests.
final class FilterByCategoryCriteria implements FilterCriteria {
  final String category;

  const FilterByCategoryCriteria({
    required this.category,
  });

  @override
  String get() => "/category/$category";
}
