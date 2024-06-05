import 'search_criteria.dart';

abstract class SearchCriteriaBuilder {
  String build({
    required String path,
    Criteria? criteria,
  });
}
