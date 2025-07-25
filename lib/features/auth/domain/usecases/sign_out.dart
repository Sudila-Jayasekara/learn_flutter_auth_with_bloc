import 'package:fpdart/fpdart.dart';
import 'package:learn_flutter_auth_with_bloc/core/error/failure.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/repository/auth_repository.dart';

class SignOut {
  final AuthRepository repository;

  SignOut({required this.repository});

  Future<Either<Failure,void>> call() async {
    return await repository.signOut();
  }
}