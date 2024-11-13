import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/api/model/request/data_request.dart';

import '../../api/model/response/coordinate.dart';
import '../../api/model/response/data.dart';
import '../../services/map_service.dart';
import '../base_cubit.dart';

part 'main_page_state.dart';

@injectable
class MainPageCubit extends BaseCubit<MainPageState> {
  final MapService _mapService;
  List<List<int>> directions = [
    [1, 0],
    [0, 1],
    [1, 1],
    [-1, 0],
    [0, -1],
    [-1, 1],
    [-1, -1],
    [1, -1],
  ];
  MainPageCubit(this._mapService)
      : super(const MainPageState(
          status: MainPageStatus.idle,
        ));

  @override
  void handleError(String errorMessage) {
    emit(MainPageState(
      status: MainPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  void resetPage() {
    emit(const MainPageState(
      status: MainPageStatus.idle,
      loadingPercent: 0,
    ));
  }

  List<Coordinate> _findShortestPath({
    required List<String> map,
    required Coordinate start,
    required Coordinate end,
  }) {
    int rows = map.length;
    int cols = map.first.length;
    List<List<bool>> visited =
        List.generate(rows, (_) => List.filled(cols, false));
    Queue<List<dynamic>> queue = Queue();

    queue.add([
      start,
      [start]
    ]);
    visited[start.x][start.y] = true;

    while (queue.isNotEmpty) {
      var current = queue.removeFirst();
      Coordinate coord = current.first;
      List<Coordinate> path = current[1];

      if (coord.x == end.x && coord.y == end.y) return path;

      for (List<int> dir in directions) {
        int nx = coord.x + dir[0];
        int ny = coord.y + dir[1];

        if (nx >= 0 &&
            nx < rows &&
            ny >= 0 &&
            ny < cols &&
            map[nx][ny] == '.' &&
            !visited[nx][ny]) {
          visited[nx][ny] = true;
          List<Coordinate> newPath = List.from(path);
          newPath.add(Coordinate(x: nx, y: ny));
          queue.add([Coordinate(x: nx, y: ny), newPath]);
        }
      }
    }

    return [];
  }

  Future<void> postMap(String url) async {
    return await makeErrorHandledCall(() async {
      emit(state.copyWith(
        status: MainPageStatus.loading,
      ));
      List<DataRequest> dataRequests = [];
      for (Data data in state.mapWithRoute.keys) {
        final path = state.mapWithRoute[data];
        String pathString = '';
        if (path == null) continue;
        for (int i = 0; i < path.length; i++) {
          final step = path[i];
          if (i != path.length - 1) {
            pathString += '(${step.x},${step.y})->';
          } else {
            pathString += '(${step.x},${step.y})';
          }
        }
        dataRequests.add(DataRequest(
          id: data.id,
          path: pathString,
          start: data.start,
          end: data.end,
        ));
      }
      await _mapService.postMap(url, dataRequests);
      emit(state.copyWith(
        status: MainPageStatus.resultsSended,
      ));
    });
  }

  Future<void> getMap(String url) async {
    return await makeErrorHandledCall(() async {
      emit(state.copyWith(
        status: MainPageStatus.loadingData,
        loadingPercent: 10,
      ));
      final map = await _mapService.getMap(url);
      Map<Data, List<Coordinate>> mapWithRoute = {};
      for (Data data in map.data) {
        final shortRoute = _findShortestPath(
          map: data.field,
          start: data.start,
          end: data.end,
        );
        if (state.loadingPercent < 80) {
          emit(state.copyWith(
            status: MainPageStatus.loadingData,
            loadingPercent: state.loadingPercent + 10,
          ));
        }
        mapWithRoute.addAll({data: shortRoute});
        await Future.delayed(const Duration(
          milliseconds: 700,
        ));
      }

      emit(state.copyWith(
        status: MainPageStatus.success,
        loadingPercent: 100,
        mapWithRoute: mapWithRoute,
      ));
    });
  }
}
