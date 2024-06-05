import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../models/responses/user_response.dart';
import '../../utils/endpoints.dart';
import '../../utils/exceptions/data_error.dart';
import '../../utils/search_criteria/search_criteria.dart';
import '../base/base_repository.dart';
import '../users_repository.dart';

final class UsersRepositoryImpl extends BaseRepository implements UsersRepository {
  @override
  Future<Either<DataError, List<UserResponse>>> get({
    Criteria? criteria,
  }) async {
    return await getRequest(
      path: Endpoints.users.value,
      criteria: criteria,
      mapper: (response) {
        final List list = jsonDecode(response);
        return list.map((e) => UserResponse.fromMap(e)).toList();
      },
    );
  }
}
