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
      requestBody: request.toJson(),
      mapper: (response) {
        final json = response?.data as Map<String, dynamic>;
        return LoginResponse.fromMap(json);
      },
    );
  }
}
