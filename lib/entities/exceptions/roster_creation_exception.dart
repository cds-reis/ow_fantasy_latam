sealed class RosterCreationException implements Exception {
  const RosterCreationException();

  String get message;
}

final class SamePlayersInTheTeamException extends RosterCreationException {
  const SamePlayersInTheTeamException();

  @override
  String get message => 'You cannot have the same player in the team twice.';
}

final class NoTransfersAvailableException extends RosterCreationException {
  const NoTransfersAvailableException();

  @override
  String get message => 'You have no transfers available for this roster.';
}

final class RosterIsNotFullException extends RosterCreationException {
  const RosterIsNotFullException();

  @override
  String get message =>
      'Your roster is not full. Please add all players to your roster';
}

final class RosterIsTheSameAsTheOriginalOneException
    extends RosterCreationException {
  const RosterIsTheSameAsTheOriginalOneException();

  @override
  String get message =>
      'You cannot submit the same roster as the original one.';
}
