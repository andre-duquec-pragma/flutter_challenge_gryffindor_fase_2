import 'package:dartz/dartz.dart';

import '../models/responses/user_response.dart';
import '../utils/exceptions/data_error.dart';
import '../utils/search_criteria/search_criteria.dart';

abstract class UsersRepository {
  Future<Either<DataError, List<UserResponse>>> get({
    Criteria? criteria,
  });
}
