import '../search_criteria.dart';

/// A search criteria to define the elements order in api request.
final class OrderCriteria implements SearchCriteria {
  final FilterOrder order;

  const OrderCriteria({
    required this.order,
  });

  @override
  String get() => "sort=${order.value}";
}

enum FilterOrder {
  desc(value: "desc"),
  asc(value: "asc");

  final String value;

  const FilterOrder({required this.value});
}
