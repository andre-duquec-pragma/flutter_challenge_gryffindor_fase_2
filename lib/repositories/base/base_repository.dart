import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../base/repository_global_config.dart';
import '../../utils/exceptions/data_error.dart';
import '../../utils/search_criteria/filter_criteria.dart';
import '../../utils/search_criteria/search_criteria.dart';
import '../../utils/search_criteria/search_criteria_builder.dart';

class BaseRepository {
  final RepositoryGlobalConfig _config;
  final SearchCriteriaBuilder _searchCriteriaBuilder;
  final Dio _dio;

  BaseRepository()
      : _config = GetIt.I.get(),
        _searchCriteriaBuilder = GetIt.I.get(),
        _dio = Dio();

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
    required ResponseModel Function(Response? response) mapper,
  }) async {
    try {
      final baseUrl = _config.baseUrl;

      final endpoint = _searchCriteriaBuilder.build(
        criteria: criteria,
        filters: filters,
        path: "$baseUrl$path",
      );

      Response? response = await _dio.get(endpoint);

      final mappedResponse = mapper(response);

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
    String? requestBody,
    required ResponseModel Function(Response? response) mapper,
  }) async {
    try {
      final baseUrl = _config.baseUrl;
      final endpoint = "$baseUrl$path";

      Response? response = await _dio.post(endpoint, data: requestBody);

      final mappedResponse = mapper(response);

      return Right(mappedResponse);
    } catch (e) {
      return Left(GenericDataError(message: e.toString()));
    }
  }
}
