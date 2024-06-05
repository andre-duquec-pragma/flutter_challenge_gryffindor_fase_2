import '../search_criteria.dart';
import '../search_criteria_priority.dart';

class LimitCriteria implements SearchCriteria {
  final int limit;

  const LimitCriteria({
    required this.limit,
  });

  @override
  SearchCriteriaPriority get priority => SearchCriteriaPriority.low;

  @override
  String get() => "limit=$limit";
}
