import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

class Password extends Equatable {
  const Password._(this.value);

  final String value;

  static Either<PasswordParsingError, Password> parse(String value) {
    if (value.trim().length < 8) {
      return const Left(NotLongEnough());
    }

    return Right(Password._(value));
  }

  @override
  List<Object?> get props => [value];
}

sealed class PasswordParsingError extends Equatable {
  const PasswordParsingError();

  String get message;

  @override
  List<Object?> get props => [];
}

final class NotLongEnough extends PasswordParsingError {
  const NotLongEnough();

  @override
  String get message => 'Password must be at least 8 characters long';
}
