import 'package:dartz/dartz.dart';

import '../models/request/login_request.dart';
import '../models/responses/login_response.dart';
import '../utils/exceptions/data_error.dart';

abstract class AuthRepository {
  Future<Either<DataError, LoginResponse>> login({
    required LoginRequest request,
  });
}
