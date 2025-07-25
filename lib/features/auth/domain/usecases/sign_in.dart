import 'package:fpdart/fpdart.dart';
import 'package:learn_flutter_auth_with_bloc/core/error/failure.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/repository/auth_repository.dart';

class SignIn {
  final AuthRepository repository;

  SignIn({required this.repository});

  Future<Either<Failure, String>> call({
    required String email,
    required String password,
  }) async {
    if (email.trim().isEmpty) {
      return const Left(ValidationFailure('Email cannot be empty'));
    }
    if (!_isValidEmail(email)) {
      return const Left(ValidationFailure('Please enter a valid email'));
    }
    if (password.trim().isEmpty) {
      return const Left(ValidationFailure('Password cannot be empty'));
    }

    return await repository.signIn(
      email: email.trim().toLowerCase(),
      password: password,
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
