import 'models/request/login_request.dart';
import 'repositories/auth_repository.dart';
import 'repositories/categories_repository.dart';
import 'repositories/implementation/auth_repository_impl.dart';
import 'repositories/implementation/categories_repository_impl.dart';
import 'repositories/implementation/products_repository_impl.dart';
import 'repositories/implementation/users_repository_impl.dart';
import 'repositories/products_repository.dart';
import 'repositories/users_repository.dart';
import 'utils/search_criteria/implementation/filter_by_category_criteria.dart';
import 'utils/search_criteria/implementation/limit_criteria.dart';
import 'utils/search_criteria/implementation/order_criteria.dart';

Future start() async {
  await _startProductsRepository();
  await _startCategoriesRepository();
  await _startUserRepository();
  await _startAuthRepository();
}

_log(String data) {
  print("---------------------------------------------------------------------------------");
  print(data);
  print("---------------------------------------------------------------------------------");
  print("*");
  print("+");
}

Future _startProductsRepository() async {
  ProductsRepository productsRepository = ProductsRepositoryImpl();

  _log("Products limit by 2 and desc order");

  final productsResponse = await productsRepository.get(
    criteria: [
      const LimitCriteria(limit: 2),
      const OrderCriteria(order: FilterOrder.desc),
    ],
  );

  productsResponse.fold((data) {
    _log("Error getting products: ${data.message}");
  }, (data) {
    final representableData = data.map((item) => item.toJson()).reduce((value, element) => "$value \n\n $element");

    _log(representableData);
  });

  _log("Single product with id 1");

  final singleProductResponse = await productsRepository.getById(id: 1);

  singleProductResponse.fold((data) {
    _log("Error getting product: ${data.message}");
  }, (data) {
    _log(data.toJson());
  });

  _log("Products by categories with limit 3");

  final productsResponseByCategories = await productsRepository.get(
    criteria: [
      const LimitCriteria(limit: 3),
    ],
    filters: [
      const FilterByCategoryCriteria(category: "electronics"),
    ],
  );

  productsResponseByCategories.fold((data) {
    _log("Error getting products by category: ${data.toString()}");
  }, (data) {
    final representableData = data.map((item) => item.toJson()).reduce((value, element) => "$value \n\n $element");

    _log(representableData);
  });
}

Future _startCategoriesRepository() async {
  _log("Categories");

  CategoriesRepository categoriesRepository = CategoriesRepositoryImpl();

  final categoriesResponse = await categoriesRepository.get();

  categoriesResponse.fold((data) {
    _log("Error getting categories: ${data.message}");
  }, (data) {
    _log(data.toJson());
  });
}

Future _startUserRepository() async {
  _log("Users with limit 2");

  UsersRepository usersRepository = UsersRepositoryImpl();

  final usersRepositoryResponse = await usersRepository.get(criteria: [const LimitCriteria(limit: 2)]);

  usersRepositoryResponse.fold((data) {
    _log("Error getting users: ${data.message}");
  }, (data) {
    final representableData = data.map((item) => item.toJson()).reduce((value, element) => "$value \n\n $element");

    _log(representableData);
  });
}

Future _startAuthRepository() async {
  _log("Login");

  AuthRepository authRepository = AuthRepositoryImpl();
  const loginRequest = LoginRequest(
    username: "mor_2314",
    password: "83r5^_",
  );

  final loginResponse = await authRepository.login(request: loginRequest);

  loginResponse.fold((data) {
    _log("Error with login: ${data.message}");
  }, (data) {
    _log(data.toJson());
  });
}
