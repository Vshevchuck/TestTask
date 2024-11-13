import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task/api/model/request/data_request.dart';
import 'package:test_task/api/model/response/map_data_response.dart';

import 'api_constants.dart';

part 'vinchesta_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class VinchestaApiClient {
  factory VinchestaApiClient(
    @Named(ApiConstants.baseApiKey) Dio dio, {
    String baseUrl,
  }) = _VinchestaApiClient;

  @GET('{url}')
  Future<MapDataResponse> getMaps({
    @Path() required String url,
  });

  @GET('{url}')
  Future<void> postMaps({
    @Path() required String url,
    @Body() required List<DataRequest> data,
  });
}
