import 'package:fpdart/fpdart.dart';
import 'package:learn_flutter_auth_with_bloc/core/error/failure.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/repository/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp({required this.repository});

  Future<Either<Failure, String>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    if (firstName.trim().isEmpty) {
      return const Left(ValidationFailure('First name cannot be empty'));
    }
    if (lastName.trim().isEmpty) {
      return const Left(ValidationFailure('Last name cannot be empty'));
    }
    if (email.trim().isEmpty) {
      return const Left(ValidationFailure('Email cannot be empty'));
    }
    if (!_isValidEmail(email)) {
      return const Left(ValidationFailure('Please enter a valid email'));
    }
    if (password.trim().isEmpty) {
      return const Left(ValidationFailure('Password cannot be empty'));
    }
    if (password.length < 4) {
      return const Left(
        ValidationFailure('Password must be at least 4 characters'),
      );
    }

    return await repository.signUp(
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      email: email.trim(),
      password: password.trim(),
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
