class EventException implements Exception {
  EventException(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}
