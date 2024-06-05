import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../models/responses/categories_response.dart';
import '../../utils/endpoints.dart';
import '../../utils/exceptions/data_error.dart';
import '../base/base_repository.dart';
import '../categories_repository.dart';

final class CategoriesRepositoryImpl extends BaseRepository implements CategoriesRepository {
  @override
  Future<Either<DataError, CategoriesResponse>> get() async {
    return await getRequest(
      path: Endpoints.categories.value,
      mapper: (response) {
        final List list = jsonDecode(response);
        return CategoriesResponse.fromMap({"data": list});
      },
    );
  }
}
