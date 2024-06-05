typedef Filters = List<FilterCriteria>;

/// An abstraction which encapsulates the mandatory data to define a filter criteria.
abstract class FilterCriteria {
  /// To get the converted data of a specific search criteria.
  String get();

  const FilterCriteria();
}
