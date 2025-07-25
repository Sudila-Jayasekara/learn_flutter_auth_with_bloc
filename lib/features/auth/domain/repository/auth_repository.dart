import 'package:fpdart/fpdart.dart';
import 'package:learn_flutter_auth_with_bloc/core/error/failure.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, bool>> isUserLoggedIn();

  Future<Either<Failure, User?>> getCurrentUser();
}