sealed class BibleAPIException implements Exception {
  final String message;
  BibleAPIException(this.message);
}

class NoInternetConnectionException extends BibleAPIException {
  NoInternetConnectionException() : super('No Internet connection');
}

// Add the api specific exceptions here
