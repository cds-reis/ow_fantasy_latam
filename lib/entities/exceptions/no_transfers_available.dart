class NoTransfersAvailableException implements Exception {
  const NoTransfersAvailableException();

  String get message => 'You have no transfers available for this roster.';
}
