import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_gryffindor_fase_2/utils/endpoints.dart';
import 'package:http/http.dart';

import '../../utils/exceptions/data_error.dart';
import '../../utils/search_criteria/filter_criteria.dart';
import '../../utils/search_criteria/implementation/search_criteria_builder_impl.dart';
import '../../utils/search_criteria/search_criteria.dart';
import '../../utils/search_criteria/search_criteria_builder.dart';

class BaseRepository {
  final SearchCriteriaBuilder _searchCriteriaBuilder;
  final client = Client();

  BaseRepository({SearchCriteriaBuilder searchCriteriaBuilder = const SearchCriteriaBuilderImpl()})
      : _searchCriteriaBuilder = searchCriteriaBuilder;

  /// To perform a get request to store api.
  ///
  /// [path] the endpoint to request.
  /// [criteria] the list of search criteria to sort the data.
  /// [filters] the list of filter criteria to filter the data.
  /// [mapper] a callback which handle the response mapping.
  Future<Either<DataError, ResponseModel>> getRequest<ResponseModel>({
    required String path,
    Criteria? criteria,
    Filters? filters,
    required ResponseModel Function(String responseBody) mapper,
  }) async {
    try {
      final baseUrl = Endpoints.base.value;

      final endpoint = _searchCriteriaBuilder.build(
        criteria: criteria,
        filters: filters,
        path: "$baseUrl$path",
      );

      Response response = await client.get(Uri.parse(endpoint));
      final mappedResponse = mapper(response.body);

      return Right(mappedResponse);
    } catch (e) {
      return Left(GenericDataError(message: e.toString()));
    }
  }

  /// To perform a post request to store api.
  ///
  /// [path] the endpoint to request.
  /// [requestBody] the json body of request.
  /// [mapper] a callback which handle the response mapping.
  Future<Either<DataError, ResponseModel>> postRequest<ResponseModel>({
    required String path,
    Map? requestBody,
    required ResponseModel Function(String responseBody) mapper,
  }) async {
    try {
      final baseUrl = Endpoints.base.value;
      final endpoint = "$baseUrl$path";

      Response? response = await client.post(Uri.parse(endpoint), body: requestBody);

      final mappedResponse = mapper(response.body);

      return Right(mappedResponse);
    } catch (e) {
      return Left(GenericDataError(message: e.toString()));
    }
  }
}
