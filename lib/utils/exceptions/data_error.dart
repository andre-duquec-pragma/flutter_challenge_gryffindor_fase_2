sealed class DataError extends Error {
  final String message;

  DataError({
    required this.message,
  });
}

final class GenericDataError extends DataError {
  GenericDataError({
    required super.message,
  });
}
