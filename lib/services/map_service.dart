import 'package:injectable/injectable.dart';
import 'package:test_task/api/model/request/data_request.dart';
import 'package:test_task/services/base_service.dart';

import '../api/model/response/map_data_response.dart';
import '../api/vinchesta_api_client.dart';

@injectable
class MapService extends BaseService {
  final VinchestaApiClient _apiClient;

  MapService(this._apiClient);

  Future<MapDataResponse> getMap(String url) async {
    return makeErrorParsedCall(() async {
      return await _apiClient.getMaps(url: url);
    });
  }

  Future<void> postMap(String url, List<DataRequest> dataRequests) async {
    return makeErrorParsedCall(() async {
      return await _apiClient.postMaps(
        url: url,
        data: dataRequests,
      );
    });
  }
}
