import '../search_criteria.dart';
import '../search_criteria_priority.dart';

final class OrderCriteria implements SearchCriteria {
  final FilterOrder order;

  const OrderCriteria({
    required this.order,
  });

  @override
  SearchCriteriaPriority get priority => SearchCriteriaPriority.low;

  @override
  String get() => "sort=${order.value}";
}

enum FilterOrder {
  desc(value: "desc"),
  asc(value: "asc");

  final String value;

  const FilterOrder({required this.value});
}
