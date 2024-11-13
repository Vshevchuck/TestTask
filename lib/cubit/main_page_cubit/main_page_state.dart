part of 'main_page_cubit.dart';

enum MainPageStatus {
  idle,
  loading,
  loadingData,
  error,
  resultsSended,
  success,
}

class MainPageState extends Equatable {
  final MainPageStatus status;
  final String errorMessage;
  final int loadingPercent;
  final Map<Data, List<Coordinate>> mapWithRoute;

  const MainPageState({
    required this.status,
    this.mapWithRoute = const {},
    this.loadingPercent = 0,
    this.errorMessage = '',
  });

  MainPageState copyWith({
    required MainPageStatus status,
    String? errorMessage,
    Map<Data, List<Coordinate>>? mapWithRoute,
    int? loadingPercent,
  }) {
    return MainPageState(
      status: status,
      mapWithRoute: mapWithRoute ?? this.mapWithRoute,
      errorMessage: errorMessage ?? this.errorMessage,
      loadingPercent: loadingPercent ?? this.loadingPercent,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      mapWithRoute,
      loadingPercent,
    ];
  }
}
