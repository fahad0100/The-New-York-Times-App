class Error404 implements Exception {
  final String message;

  Error404(this.message);

  @override
  String toString() {
    return 'Error 404: $message';
  }
}

class Error401 implements Exception {
  final String message;

  Error401(this.message);

  @override
  String toString() {
    return 'Error 404: $message';
  }
}

class ErrorConnect implements Exception {
  final String message;

  ErrorConnect(this.message);

  @override
  String toString() {
    return 'Error 404: $message';
  }
}
