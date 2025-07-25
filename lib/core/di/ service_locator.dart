

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learn_flutter_auth_with_bloc/core/network/dio_client.dart';
import 'package:learn_flutter_auth_with_bloc/core/network/network_info.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/usecases/check_auth_status.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/usecases/sign_in.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/usecases/sign_out.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/usecases/sign_up.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External dependencies
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // Core
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => SignUp(repository: sl()));
  sl.registerLazySingleton(() => SignIn(repository: sl()));
  sl.registerLazySingleton(() => SignOut(repository: sl()));
  sl.registerLazySingleton(() => CheckAuthStatus(repository: sl()));

  // BLoC
  sl.registerFactory(
    () => AuthBloc(
      signUp: sl(),
      signIn: sl(),
      signOut: sl(),
      checkAuthStatus: sl(),
    ),
  );
}