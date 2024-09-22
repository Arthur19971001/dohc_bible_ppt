sealed class BibleAPIException implements Exception {
  final String message;
  BibleAPIException(this.message);
}

class NotFoundException extends BibleAPIException {
  NotFoundException() : super('Not Found');
}
