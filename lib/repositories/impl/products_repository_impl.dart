import 'package:dartz/dartz.dart';

import '../../models/responses/product_response.dart';
import '../../utils/endpoints.dart';
import '../../utils/exceptions/data_error.dart';
import '../../utils/search_criteria/filter_criteria.dart';
import '../../utils/search_criteria/search_criteria.dart';
import '../base/base_repository.dart';
import '../products_repository.dart';

final class ProductsRepositoryImpl extends BaseRepository implements ProductsRepository {
  @override
  Future<Either<DataError, List<ProductResponse>>> get({
    Criteria? criteria,
    Filters? filters,
  }) async {
    return await super.getRequest(
      path: Endpoints.products.value,
      criteria: criteria,
      mapper: (response) {
        Iterable? list = response?.data as List;
        return list.map((e) => ProductResponse.fromMap(e)).toList();
      },
    );
  }

  @override
  Future<Either<DataError, ProductResponse>> getById({
    required int id,
  }) async {
    final endpoint = "${Endpoints.products.value}/$id";

    return await super.getRequest(
      path: endpoint,
      mapper: (response) {
        final json = response?.data as Map<String, dynamic>;
        return ProductResponse.fromMap(json);
      },
    );
  }
}
