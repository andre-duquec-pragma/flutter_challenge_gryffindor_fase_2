import 'package:dartz/dartz.dart';

import '../models/responses/user_response.dart';
import '../utils/exceptions/data_error.dart';
import '../utils/search_criteria/search_criteria.dart';

abstract class UsersRepository {
  /// To get all users
  ///
  /// [criteria] the search criteria to sort the request data.
  ///
  /// Returns a [Either] value.
  /// Left side corresponds to possible errors.
  /// Right side corresponds to a list of users.
  Future<Either<DataError, List<UserResponse>>> get({
    Criteria? criteria,
  });
}
