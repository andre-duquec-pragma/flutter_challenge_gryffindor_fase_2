import '../search_criteria.dart';
import '../search_criteria_priority.dart';

final class FilterByCategoryCriteria implements SearchCriteria {
  final String category;

  const FilterByCategoryCriteria({
    required this.category,
  });

  @override
  SearchCriteriaPriority get priority => SearchCriteriaPriority.high;

  @override
  String get() => "/category/$category";
}
