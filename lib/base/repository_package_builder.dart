import 'package:get_it/get_it.dart';

import '../repositories/auth_repository.dart';
import '../repositories/categories_repository.dart';
import '../repositories/impl/auth_repository_impl.dart';
import '../repositories/impl/categories_repository_impl.dart';
import '../repositories/impl/products_repository_impl.dart';
import '../repositories/impl/users_repository_impl.dart';
import '../repositories/products_repository.dart';
import '../repositories/users_repository.dart';
import '../utils/search_criteria/impl/search_criteria_builder_impl.dart';
import '../utils/search_criteria/search_criteria_builder.dart';
import 'repository_global_config.dart';

final class RepositoryPackageBuilder {
  /// To initialize a global config implementation and register all internal dependencies.
  static start({required RepositoryGlobalConfig config}) {
    final injector = GetIt.I;

    injector.registerFactory<RepositoryGlobalConfig>(() => config);
    injector.registerFactory<SearchCriteriaBuilder>(() => SearchCriteriaBuilderImpl());

    injector.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
    injector.registerFactory<CategoriesRepository>(() => CategoriesRepositoryImpl());
    injector.registerFactory<ProductsRepository>(() => ProductsRepositoryImpl());
    injector.registerFactory<UsersRepository>(() => UsersRepositoryImpl());
  }
}
