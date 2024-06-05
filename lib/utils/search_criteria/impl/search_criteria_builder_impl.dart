import '../search_criteria.dart';
import '../search_criteria_builder.dart';
import '../search_criteria_priority.dart';

final class SearchCriteriaBuilderImpl implements SearchCriteriaBuilder {
  final String _queryParamInitialOperator = "?";
  final String _queryParamAdditionOperator = "&";

  @override
  String build({
    required String path,
    Criteria? criteria,
  }) {
    final searchCriteria = criteria?.toList() ?? [];
    searchCriteria.sort((item1, item2) => item1.priority.value.compareTo(item2.priority.value));

    String additionalArguments = "";

    for (SearchCriteria item in searchCriteria) {
      additionalArguments += _getCriteria(
        criteria: item,
        currentArguments: additionalArguments,
      );
    }

    return "$path$additionalArguments";
  }

  String _getCriteria({
    required SearchCriteria criteria,
    required String currentArguments,
  }) {
    switch (criteria.priority) {
      case SearchCriteriaPriority.high:
        return criteria.get();
      case SearchCriteriaPriority.low:
        String operator = currentArguments.contains(_queryParamInitialOperator)
            ? _queryParamAdditionOperator
            : _queryParamInitialOperator;
        return "$operator${criteria.get()}";
    }
  }
}
