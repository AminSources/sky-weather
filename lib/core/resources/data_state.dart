abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState({required this.data, required this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T? data) : super(data: data, error: null);
}

class DataError<T> extends DataState<T> {
  DataError(String? error) : super(data: null, error: error);
}
