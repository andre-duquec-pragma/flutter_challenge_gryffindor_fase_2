import 'package:dartz/dartz.dart';

import '../models/responses/categories_dto.dart';
import '../utils/exceptions/data_error.dart';

abstract class CategoriesRepository {
  Future<Either<DataError, CategoriesResponse>> get();
}
