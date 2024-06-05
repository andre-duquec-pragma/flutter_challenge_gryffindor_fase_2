import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'base/repository_global_config.dart';
import 'base/repository_package_builder.dart';
import 'models/request/login_request.dart';
import 'repositories/auth_repository.dart';
import 'repositories/categories_repository.dart';
import 'repositories/impl/auth_repository_impl.dart';
import 'repositories/impl/categories_repository_impl.dart';
import 'repositories/impl/products_repository_impl.dart';
import 'repositories/impl/users_repository_impl.dart';
import 'repositories/products_repository.dart';
import 'repositories/users_repository.dart';
import 'utils/search_criteria/impl/filter_by_category_criteria.dart';
import 'utils/search_criteria/impl/limit_criteria.dart';
import 'utils/search_criteria/impl/order_criteria.dart';

void main() {
  runApp(MainApp());
}

class RepositoryGlobalConfigImpl implements RepositoryGlobalConfig {
  @override
  String get baseUrl => "https://fakestoreapi.com";
}

class MainApp extends StatelessWidget {
  final logger = Logger();

  MainApp({super.key}) {
    RepositoryPackageBuilder.start(
      config: RepositoryGlobalConfigImpl(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await _start();
            },
            child: const Text("Press me"),
          ),
        ),
      ),
    );
  }

  Future _start() async {
    await _startProductsRepository();
    await _startCategoriesRepository();
    await _startUserRepository();
    await _startAuthRepository();
  }

  Future _startProductsRepository() async {
    ProductsRepository productsRepository = ProductsRepositoryImpl();

    logger.i("Products limit by 2 and desc order");

    final productsResponse = await productsRepository.get(
      criteria: [
        const LimitCriteria(limit: 2),
        const OrderCriteria(order: FilterOrder.desc),
      ],
    );

    productsResponse.fold((data) {
      logger.e("Error getting products: ${data.message}");
    }, (data) {
      final representableData = data.map((item) => item.toJson()).reduce((value, element) => "$value \n\n $element");

      logger.i(representableData);
    });

    logger.w("NEW DATA BLOCK");
    logger.i("Single product with id 1");

    final singleProductResponse = await productsRepository.getById(id: 1);

    singleProductResponse.fold((data) {
      logger.e("Error getting product: ${data.message}");
    }, (data) {
      logger.i(data.toJson());
    });

    logger.w("NEW DATA BLOCK");
    logger.i("Products by categories with limit 3");

    final productsResponseByCategories = await productsRepository.get(
      criteria: [
        const FilterByCategoryCriteria(category: "electronics"),
        const LimitCriteria(limit: 3),
      ],
    );

    productsResponseByCategories.fold((data) {
      logger.e("Error getting products by category: ${data.toString()}");
    }, (data) {
      final representableData = data.map((item) => item.toJson()).reduce((value, element) => "$value \n\n $element");

      logger.i(representableData);
    });
  }

  Future _startCategoriesRepository() async {
    logger.w("NEW DATA BLOCK");
    logger.i("Categories");

    CategoriesRepository categoriesRepository = CategoriesRepositoryImpl();

    final categoriesResponse = await categoriesRepository.get();

    categoriesResponse.fold((data) {
      logger.e("Error getting categories: ${data.message}");
    }, (data) {
      logger.i(data.toJson());
    });
  }

  Future _startUserRepository() async {
    logger.w("NEW DATA BLOCK");
    logger.i("Users with limit 2");

    UsersRepository usersRepository = UsersRepositoryImpl();

    final usersRepositoryResponse = await usersRepository.get(criteria: [const LimitCriteria(limit: 2)]);

    usersRepositoryResponse.fold((data) {
      logger.e("Error getting users: ${data.message}");
    }, (data) {
      final representableData = data.map((item) => item.toJson()).reduce((value, element) => "$value \n\n $element");

      logger.i(representableData);
    });
  }

  Future _startAuthRepository() async {
    logger.w("NEW DATA BLOCK");
    logger.i("Login");

    AuthRepository authRepository = AuthRepositoryImpl();
    const loginRequest = LoginRequest(
      username: "mor_2314",
      password: "83r5^_",
    );

    final loginResponse = await authRepository.login(request: loginRequest);

    loginResponse.fold((data) {
      logger.e("Error with login: ${data.message}");
    }, (data) {
      logger.i(data.toJson());
    });
  }
}
