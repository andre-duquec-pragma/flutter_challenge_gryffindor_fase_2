import 'package:dartz/dartz.dart';

import '../models/responses/product_response.dart';
import '../utils/exceptions/data_error.dart';
import '../utils/search_criteria/search_criteria.dart';

abstract class ProductsRepository {
  Future<Either<DataError, List<ProductResponse>>> get({
    Criteria? criteria,
  });

  Future<Either<DataError, ProductResponse>> getById({
    required int id,
  });
}
