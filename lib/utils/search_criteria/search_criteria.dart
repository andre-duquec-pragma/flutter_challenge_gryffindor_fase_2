typedef Criteria = List<SearchCriteria>;

/// An abstraction which encapsulates the mandatory data to define a search criteria.
abstract class SearchCriteria {
  /// To get the converted data of a specific search criteria.
  String get();

  const SearchCriteria();
}
