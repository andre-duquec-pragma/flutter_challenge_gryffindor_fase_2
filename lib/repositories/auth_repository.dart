import 'package:dartz/dartz.dart';

import '../models/request/login_request.dart';
import '../models/responses/login_response.dart';
import '../utils/exceptions/data_error.dart';

abstract class AuthRepository {
  /// To perform a login request.
  ///
  /// [request] the data model that encapsulates login data.
  ///
  /// Returns a [Either] value.
  /// Left side corresponds to possible errors.
  /// Right side corresponds to login response object.
  Future<Either<DataError, LoginResponse>> login({
    required LoginRequest request,
  });
}
