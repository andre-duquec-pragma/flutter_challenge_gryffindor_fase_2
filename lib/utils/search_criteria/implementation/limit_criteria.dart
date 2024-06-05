import '../search_criteria.dart';

/// A search criteria to define a results limit in api response.
class LimitCriteria implements SearchCriteria {
  final int limit;

  const LimitCriteria({
    required this.limit,
  });

  @override
  String get() => "limit=$limit";
}
