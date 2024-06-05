import 'package:dartz/dartz.dart';

import '../../models/responses/categories_dto.dart';
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
        Iterable? list = response?.data as List;
        return CategoriesResponse.fromMap({"data": list});
      },
    );
  }
}
