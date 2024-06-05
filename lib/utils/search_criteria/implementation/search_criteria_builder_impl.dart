import '../filter_criteria.dart';
import '../search_criteria.dart';
import '../search_criteria_builder.dart';

final class SearchCriteriaBuilderImpl implements SearchCriteriaBuilder {
  final String _queryParamInitialOperator = "?";
  final String _queryParamAdditionOperator = "&";

  const SearchCriteriaBuilderImpl();

  @override
  String build({
    required String path,
    Criteria? criteria,
    Filters? filters,
  }) {
    final searchCriteria = criteria?.toList() ?? [];
    final filterCriteria = filters?.toList() ?? [];

    String additionalArguments = "";

    for (FilterCriteria item in filterCriteria) {
      additionalArguments += _getFilter(
        filter: item,
        currentArguments: additionalArguments,
      );
    }

    for (SearchCriteria item in searchCriteria) {
      additionalArguments += _getCriteria(
        criteria: item,
        currentArguments: additionalArguments,
      );
    }

    return "$path$additionalArguments";
  }

  /// Appends a new criteria to current arguments.
  ///
  /// [criteria] the search criteria to evaluate.
  /// [currentArguments] the previous added arguments to append.
  String _getCriteria({
    required SearchCriteria criteria,
    required String currentArguments,
  }) {
    String operator = currentArguments.contains(_queryParamInitialOperator)
        ? _queryParamAdditionOperator
        : _queryParamInitialOperator;

    return "$operator${criteria.get()}";
  }

  /// Appends a new filter to current arguments.
  ///
  /// [filter] the filter criteria to evaluate.
  /// [currentArguments] the previous added arguments to append.
  String _getFilter({
    required FilterCriteria filter,
    required String currentArguments,
  }) {
    return filter.get();
  }
}
