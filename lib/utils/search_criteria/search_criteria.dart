import 'search_criteria_priority.dart';

typedef Criteria = List<SearchCriteria>;

abstract class SearchCriteria {
  SearchCriteriaPriority get priority;

  String get();

  const SearchCriteria();
}
