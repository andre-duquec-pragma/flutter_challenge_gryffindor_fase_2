import 'package:get_it/get_it.dart';

import '../utils/search_criteria/impl/search_criteria_builder_impl.dart';
import '../utils/search_criteria/search_criteria_builder.dart';
import 'repository_global_config.dart';

final class RepositoryPackageBuilder {
  /// To initialize a global config implementation and register all internal dependencies.
  static start({required RepositoryGlobalConfig config}) {
    final injector = GetIt.I;

    injector.registerFactory<RepositoryGlobalConfig>(() => config);
    injector.registerFactory<SearchCriteriaBuilder>(() => SearchCriteriaBuilderImpl());
  }
}
