import 'package:fpdart/fpdart.dart';
import 'package:learn_flutter_auth_with_bloc/core/error/failure.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/repository/auth_repository.dart';

class CheckAuthStatus {
  final AuthRepository repository;

  CheckAuthStatus({required this.repository});

  Future<Either<Failure,bool>> call() async{
    return await repository.isUserLoggedIn();
  }
}