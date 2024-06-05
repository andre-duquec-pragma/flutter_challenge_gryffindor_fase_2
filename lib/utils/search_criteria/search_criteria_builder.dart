import 'filter_criteria.dart';
import 'search_criteria.dart';

abstract class SearchCriteriaBuilder {
  /// Takes an endpoint and add it all the available search criteria.
  ///
  /// [path] A route or endpoint.
  /// [criteria] a list of search criteria which will be added to path.
  /// [filters] a list of filters which will be added to path.
  String build({
    required String path,
    Criteria? criteria,
    Filters? filters,
  });
}
