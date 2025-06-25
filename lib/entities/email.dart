import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

class Email extends Equatable {
  const Email._(this.value);

  final String value;

  static Either<EmailErrorMessage, Email> parse(String value) {
    if (!EmailValidator.validate(value)) {
      return const Left(EmailErrorMessage._('Invalid email'));
    }

    return Right(Email._(value));
  }

  @override
  List<Object?> get props => [value];
}

extension type const EmailErrorMessage._(String _) implements String {}
