import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../models/request/login_request.dart';
import '../../models/responses/login_response.dart';
import '../../utils/endpoints.dart';
import '../../utils/exceptions/data_error.dart';
import '../auth_repository.dart';
import '../base/base_repository.dart';

final class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  @override
  Future<Either<DataError, LoginResponse>> login({
    required LoginRequest request,
  }) async {
    return await postRequest(
      path: Endpoints.login.value,
      requestBody: request.toMap(),
      mapper: (response) {
        final json = jsonDecode(response);
        return LoginResponse.fromMap(json);
      },
    );
  }
}
