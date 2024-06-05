import 'package:dartz/dartz.dart';

import '../models/responses/product_response.dart';
import '../utils/exceptions/data_error.dart';
import '../utils/search_criteria/filter_criteria.dart';
import '../utils/search_criteria/search_criteria.dart';

abstract class ProductsRepository {
  /// To get all products
  ///
  /// [criteria] the search criteria to sort the request data.
  /// [filter] the filter criteria to filter the request data.
  ///
  /// Returns a [Either] value.
  /// Left side corresponds to possible errors.
  /// Right side corresponds to a list of products.
  Future<Either<DataError, List<ProductResponse>>> get({
    Criteria? criteria,
    Filters? filters,
  });

  /// To get a single product by id.
  ///
  /// [id] the identification of the product to search.
  ///
  /// Returns a [Either] value.
  /// Left side corresponds to possible errors.
  /// Right side corresponds to a single product.
  Future<Either<DataError, ProductResponse>> getById({
    required int id,
  });
}
