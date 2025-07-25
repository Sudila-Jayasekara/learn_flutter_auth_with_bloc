import 'package:dio/dio.dart';
import 'package:learn_flutter_auth_with_bloc/core/error/exceptions.dart';
import 'package:learn_flutter_auth_with_bloc/core/network/dio_client.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/data/models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<String> signIn({
    required String email,
    required String password,
  });
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.dio.post(
        '/api/v1/auth/register',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final authResponse = AuthResponseModel.fromJson(response.data);
        if (authResponse.token.isNotEmpty) {
          return authResponse.token;
        } else if (authResponse.message != null) {
          throw ServerException(authResponse.message!);
        } else {
          throw const ServerException('Unknown error occurred');
        }
      } else {
        throw ServerException('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.data != null && e.response?.data['message'] != null) {
        throw ServerException(e.response!.data['message']);
      } else if (e.type == DioExceptionType.connectionTimeout ||
                 e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkException('Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException('No internet connection');
      } else {
        throw ServerException('Network error: ${e.message}');
      }
    } catch (e) {
      throw ServerException('Unexpected error: $e');
    }
  }


  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.dio.post(
        '/api/v1/auth/authenticate',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final authResponse = AuthResponseModel.fromJson(response.data);
        return authResponse.token;
      } else {
        throw const ServerException('Authentication failed');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const ServerException('Invalid email or password');
      } else if (e.type == DioExceptionType.connectionTimeout ||
                 e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkException('Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException('No internet connection');
      } else {
        throw ServerException('Network error: ${e.message}');
      }
    } catch (e) {
      throw ServerException('Unexpected error: $e');
    }
  }
}